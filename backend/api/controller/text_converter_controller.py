from ..helper.translator import *


class text_converter_controller:

    def __init__(self, text_input, language_selected, language_convert):
        self.language_selected = language_selected
        self.language_convert = language_convert

        translator = translator_helper(
            language_selected=self.language_selected,
            language_convert=self.language_convert
        )

        self.text_input = text_input
        self.text_output = translator.text_to_text(self.text_input)
        self.speech_input = translator.text_to_speech(self.text_input)
        self.speech_output = "example speech output text_converter_controller"
