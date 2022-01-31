from ..helper.translator import *


class text_detection_translator_controller:

    def __init__(self, image_input, language_selected, language_convert):
        self.image_input = image_input
        self.language_selected = language_selected
        self.language_convert = language_convert

        self.created()
        self.text_input = "example text input text_detection_translator_controller"
        self.text_output = "example text output text_detection_translator_controller"
        self.speech_input = "example speech input text_detection_translator_controller"
        self.speech_output = "example speech output text_detection_translator_controller"

    def created(self):
        translator = translator_helper(
            language_selected=self.language_selected,
            language_convert=self.language_convert
        )
