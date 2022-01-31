from ..helper.translator import *


class object_detection_controller:

    def __init__(self, image_input, language_selected, language_convert):
        self.image_input = image_input
        self.language_selected = language_selected
        self.language_convert = language_convert

        self.created()
        self.text_input = "example text input object_detection_controller"
        self.text_output = "example text output object_detection_controller"
        self.speech_input = "example speech input object_detection_controller"
        self.speech_output = "example speech output object_detection_controller"

    def created(self):
        translator = translator_helper(
            language_selected=self.language_selected,
            language_convert=self.language_convert
        )
