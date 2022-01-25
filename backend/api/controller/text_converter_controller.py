from googletrans import Translator


class text_converter_controller:
    def __init__(self, text_input, language_selected, language_convert):

        self.text_input = text_input
        self.language_selected = language_selected
        self.language_convert = language_convert

        self.text_input = "example text input text_converter_controller"
        self.text_output = "example text output text_converter_controller"
        self.speech_input = "example speech input text_converter_controller"
        self.speech_output = "example speech output text_converter_controller"
