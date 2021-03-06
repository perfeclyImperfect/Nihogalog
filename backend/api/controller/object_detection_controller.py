from ..helper.translator import *

class object_detection_controller:
    def __init__(self, image_input, language_selected, language_convert):
        self.image_input = image_input
        self.language_selected = language_selected
        self.language_convert = language_convert
        translator = translator_helper(
            language_selected=self.language_selected,
            language_convert=self.language_convert
        )
        self.output_image = translator.object_image_detection(self.image_input)
