import speech_recognition as sr


r = sr.Recognizer()
##formato AUDIO WAV
direction = sr.AudioFile('C:\\Users\\Raf\\Desktop\\Transcripciones\\VideoConversiondeUnidades.wav')
UbicacionArchivo = 'C:\\Users\\Raf\\Desktop\\Transcripciones\\AudioConvText.txt'
with direction as source:
    print('Speak Anything : ')
    audio = r.listen(source)

    text = r.recognize_google(audio, language = 'es')
    print('You said: {}'.format(text))
    archivo = open(UbicacionArchivo,'w')
    archivo.write(text)
    archivo.close()
