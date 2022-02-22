from ..helper.translator import *


class speech_converter_controller:

    def __init__(self, speech_input, language_selected, language_convert):
        self.speech_input = speech_input
        self.language_selected = language_selected
        self.language_convert = language_convert

        translator = translator_helper(
            language_selected=self.language_selected,
            language_convert=self.language_convert
        )
        self.text_input = translator.speech_to_text( speech_input )
        self.text_output = translator.text_to_text( self.text_input )
        self.text_romaji = translator.text_to_romaji(self.text_output)
        self.text_emotion = translator.text_to_emoition(self.text_input) 