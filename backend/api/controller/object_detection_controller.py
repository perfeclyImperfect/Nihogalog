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
        self.text_input = translator.object_to_text( image_input )
        self.text_output = translator.text_to_text( self.text_input )
        self.text_romaji = translator.text_to_romaji(self.text_output)
        self.text_emotion = translator.text_to_emoition(self.text_input) 
