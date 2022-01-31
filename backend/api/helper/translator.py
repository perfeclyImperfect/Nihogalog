from gtts import gTTS
from django.core.files.storage import default_storage
from googletrans import Translator
from django.http import FileResponse
import os


class translator_helper:

    def __init__(self, language_selected, language_convert):
        self.language_selected = language_selected
        self.language_convert = language_convert

    def text_to_text(self, text_input):
        translator = Translator()
        translator = translator.translate(
            text_input, dest=self.language_convert)
        return translator.text

    def text_to_speech(self, text_input):
        TTS = gTTS(text=text_input, lang=self.language_selected)
        return "example text to speech"

    def speech_to_speech(self, speech_input):
        pass

    def speech_to_text(self, speech_input):
        pass

    def emotion_to_text(self, image_input):
        pass

    def object_to_text(self, image_input):
        pass

    def text_image_to_text(self, image_input):
        pass

    # Text = "ありがとうございました"
    # print("please wait...processing")
    # TTS = gTTS(text=Text, lang='ja')
    # TTS.save("voice.mp3")
    # print(TTS)
