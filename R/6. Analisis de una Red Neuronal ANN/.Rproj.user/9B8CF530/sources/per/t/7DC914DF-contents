# install.packages('keras')
# install.packages('tensorflow')

# importando librerias
library(keras)
# install_keras()
# install_keras(tensorflow = 'gpu')

# importando datos
fashion_mnist = dataset_fashion_mnist()

# test-train-split 
c(train_images, train_labels) %<-% fashion_mnist$train
c(test_images, test_labels)   %<-% fashion_mnist$test

# Explorando la Estructura de los Datos
dim(train_images)
str(train_images)

# Visualizando la imagen
fobject <- train_images[5,,]
plot(as.raster(fobject, max = 255))

class_names = c('T-shirts/top',
                'Trouser',
                'Pullover',
                'Dress',
                'Coat',
                'Sandal',
                'Shirt',
                'Sneaker',
                'Bag',
                'Ankle boot')
class_names[train_labels[5]+1]

# Normalizando [(X-mean)/Std.Dev]
train_images <- train_images/255
test_images  <- test_images/255

# Creando una validacion por separacion - usando el sincronizado del hiperparametro
val_indices <- 1:5000
val_images  <- train_images[val_indices,,]
part_train_images <- train_images[-val_indices,,]
val_labels <- train_labels[val_indices]
part_train_labels <- train_labels[-val_indices]

# Aplanamiento
model <- keras_model_sequential()
model %>%
  layer_flatten(input_shape = c(28,28)) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 10, activation = 'softmax')

model %>% compile(
  optimizer = 'sgd',
  loss = 'sparse_categorical_crossentropy',
  metrics = c('accuracy'))

model %>% fit(part_train_images, part_train_labels, epochs = 30, batch_size=100, validation_data=list(val_images, val_labels))

# Prueba de Rendimiento
score <- model %>% evaluate(test_images, test_labels)

cat('Test loss:', score['loss'], "\n")
cat('Test accuracy:', score['accuracy'], "\n")

# Prediccion en el Test set
predictions <- model %>% predict(test_images)
predictions[1, ]
which.max(predictions[1, ])
class_names[which.max(predictions[1, ])]
plot(as.raster(test_images[1, , ], max = 255))

class_pred <- model %>% predict(test_images) %>% k_argmax()
class_pred[1:20]