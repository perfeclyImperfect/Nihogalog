from googletrans import Translator


class text_converter_controller:
    def __init__(self, text_input, language_selected, language_convert):
        self.text_input = text_input
        self.language_selected = language_selected
        self.language_convert = language_convert

    def main(self, *args, **kwargs):
        print(self.language_convert)
