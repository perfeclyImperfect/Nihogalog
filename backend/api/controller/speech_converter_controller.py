class speech_converter_controller:

    def __init__(self, speech_input, language_selected, language_convert):
        self.speech_input = speech_input
        self.language_selected = language_selected
        self.language_convert = language_convert

    def main(self, *args, **kwargs):
        print(self.language_convert)
