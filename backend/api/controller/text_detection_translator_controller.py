class text_detection_translator_controller:
    def __init__(self, image_input, language_selected, language_convert):
        self.image_input = image_input
        self.language_selected = language_selected
        self.language_convert = language_convert

    def main(self, *args, **kwargs):
        print(self.language_convert)
