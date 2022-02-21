from gtts import gTTS
from django.core.files.storage import default_storage
from googletrans import Translator
import cutlet
from django.http import FileResponse
import os
import nltk
nltk.download('omw-1.4')


import json
import text2emotion as te

class translator_helper:

    def __init__(self, language_selected, language_convert):
        self.language_selected = language_selected
        self.language_convert = language_convert

    def text_to_romaji(self, text_input):
        katsu = cutlet.Cutlet()
        return katsu.romaji(text_input)

    def text_to_emoition(self, text_input):
        translator = Translator()
        text_to_emotion = translator.translate( text_input, dest='en')
        return te.get_emotion(text_to_emotion.text)

    def text_to_text(self, text_input):
        translator = Translator()
        translate_text = translator.translate( text_input, dest=self.language_convert)
        
        

        return translate_text.text

    def text_to_speech(self, text_input):
        TTS = gTTS(text=text_input, lang=self.language_selected)
        return "example text to speech"

    def speech_to_speech(self, speech_input):
        pass

    def speech_to_text(self, speech_input):
        pass

    def object_to_text(self, image_input):
        pass

    # Text = "ありがとうございました"
    # print("please wait...processing")
    # TTS = gTTS(text=Text, lang='ja')
    # TTS.save("voice.mp3")
    # print(TTS)
