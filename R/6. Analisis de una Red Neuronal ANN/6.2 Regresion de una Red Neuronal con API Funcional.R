library(keras)
library(tensorflow)
# install_keras()
# install_keras(tensorflow ='gpu')

# Para modelos complejos

# importando datos
boston_housing <- dataset_boston_housing()

# test-train split
c(train_data, BHtrain_labels) %<-% boston_housing$train
c(test_data, BHtest_labels) %<-% boston_housing$test

# Normalizando los datos
train_data <- scale(train_data)

col_means_train   <- attr(train_data, 'scaled:center')
col_stddevs_train <- attr(train_data, 'scaled:scale')
test_data <- scale(test_data, center = col_means_train, scale = col_stddevs_train)

# API funcional tiene 2 partes: entradas y salidas

# Capa de entrada
inputs <- layer_input(shape = dim(train_data)[2])

# Capa de salida
BHpredictions <- inputs %>%
    layer_dense(units = 64, activation = 'relu') %>%
    layer_dense(units = 64, activation = 'relu') %>%
    layer_dense(units = 1)

# Creando y compilando el modelo
model <- keras_model(inputs = inputs, outputs = BHpredictions)
model %>% compile(
  optimizer = 'rmsprop',
  loss = 'mse',
  metrics = list('mean_absolute_error')
)

model %>% fit(train_data,BHtrain_labels,epochs=30,batch_size=100)

# Prueba de rendimiento

BHscore <- model %>% evaluate(test_data, BHtest_labels)

cat('Test loss:', BHscore['loss'], "\n")
cat('Test absolute error:', BHscore['mean_absolute_error'], '\n')


# Arquitecturas complejas usando una API funcional

# Capa de entrada
inputs_func <- layer_input(shape = dim(train_data)[2])

# Capa de salida
BHpredictions_func <- inputs_func %>%
  layer_dense(units = 64, activation = 'relu') %>%
  layer_dense(units = 64, activation = 'relu')

main_output <- layer_concatenate(c(BHpredictions_func, inputs_func)) %>%
  layer_dense(units = 1)  

# Crear y compilar el modelo
model_func <- keras_model(inputs = inputs_func, outputs = main_output)
model_func %>% compile(
  optimizer = 'rmsprop',
  loss      = 'mse',
  metrics   = list('mean_absolute_error')
)

summary(model_func)
model_func %>% fit(train_data, BHtrain_labels, epochs=30, batch_size=100)

# Prueba de rendimiento
score_func <- model_func %>% evaluate(test_data, BHtest_labels)
cat('Functional model test loss', score_func['loss'], '\n')
cat('Normal model test loss', BHscore['loss'], '\n')
cat('Functional model test Mean abs error', score_func['mean_absolute_error'], '\n')
cat('Normal model test Mean abs error', BHscore['mean_absolute_error'], '\n')


# Guardando-Restaurando modelo y llamandolos de nuevo
model_func %>% save_model_hdf5('my_model.h5')
model_new  <-  load_model_hdf5('my_model.h5') 

model_func %>% summary()
model_new  %>% summary()

# Guardando puntos de carga de epochs 
checkpoint_dir <- 'checkpoints'
dir.create(checkpoint_dir, showWarnings = FALSE)
filepath <- file.path(checkpoint_dir, 'Epoch={epoch:02d}.hdf5')

cp_callback <- callback_model_checkpoint(filepath = filepath)

rm(model_func)
k_clear_session()

model_callback <- keras_model(inputs =  inputs_func, outputs = main_output)
model_callback %>% compile(
  optimizer = 'rmsprop',
  loss = 'mse',
  metrics = list('mean_absolute_error')
) 

model_callback %>% fit(train_data, BHtrain_labels, epochs=30, 
                       callbacks = list(cp_callback))

list.files(checkpoint_dir)
tenth_model <- load_model_hdf5(file.path(checkpoint_dir, 'Epoch=10.hdf5'))
summary(tenth_model)

# Guardando solo el mejor modelo
callback_best <- callback_model_checkpoint(filepath = 'best_model.h5', monitor = 'val_loss',
                                           save_best_only =TRUE)
rm(model_callback)
k_clear_session()

model_cb_best <-  keras_model(inputs = inputs_func, outputs = main_output)
model_cb_best %>% compile(
  optimizer = 'rmsprop',
  loss      = 'mse',
  metrics   = list('mean_absolute_error')
)
model_cb_best %>% fit(train_data, BHtrain_labels, epochs=30, 
                      validation_data=list(test_data,BHtest_labels),
                      callbacks = list(callback_best))

best_model <- load_model_hdf5('best_model.h5')

# Detener los porcesos cuando se halla el mejor modelo
callback_list <- list(
  callback_early_stopping(monitor =  'val_loss', patience = 3),
  callback_model_checkpoint(filepath = 'best_model_early_stopping.h5', monitor = 'val_loss', save_best_only = TRUE)
)

rm(model_cb_best)
k_clear_session()

model_cb_early <- keras_model(inputs = inputs_func, outputs = main_output)
model_cb_early %>% compile(
  optimizer = 'rmsprop',
  loss      = 'mse',
  metrics   = list('mean_absolute_error')
)
model_cb_early %>% fit(train_data, BHtrain_labels, epochs=100, 
                       validation_data=list(test_data,BHtest_labels),
                       callbacks = list(callback_list))
