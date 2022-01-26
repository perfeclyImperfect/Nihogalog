from ..helper.translator import *


class speech_converter_controller:

    def __init__(self, speech_input, language_selected, language_convert):
        self.speech_input = speech_input
        self.language_selected = language_selected
        self.language_convert = language_convert

        self.created()
        self.text_input = "example text input speech_converter_controller"
        self.text_output = "example text output speech_converter_controller"
        self.speech_input = "example speech input speech_converter_controller"
        self.speech_output = "example speech output speech_converter_controller"

    def created(self):
        translator = translator_helper(
            language_selected=self.language_selected,
            language_convert=self.language_convert
        )
