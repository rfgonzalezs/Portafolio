from textblob import TextBlob

ubicacion = 'C:\\Users\\Raf\\Desktop\\Transcripciones\\Texto.txt'
with open(ubicacion) as archivo:
    text = archivo.read()
    print('Texto original: \n',text, '\n')
    transtext = TextBlob(text)
    print('Texto traducido: ', transtext.translate(from_lang= 'en', to='es'))
    
##    text1 = TextBlob('Comment ca va?')
##    print('Texto original: {}'.format(text1))
##    print('Texto traducido: ', text1.translate(from_lang= 'fr', to='en'))




