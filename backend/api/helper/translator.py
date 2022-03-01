
import cutlet
import speech_recognition as sr
import urllib3
import nltk
from ibm_watson import ToneAnalyzerV3, SpeechToTextV1, LanguageTranslatorV3
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator
from google.cloud import translate_v2 as translate


# import numpy as np
# import cv2
# import matplotlib.pyplot as plt
# from gtts import gTTS
# from pytesseract import Output

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
nltk.download('omw-1.4')
class translator_helper:

    def __init__(self, language_selected, language_convert):
        self.language_selected = language_selected
        self.language_convert = language_convert

    def text_to_romaji(self, text_input):
        katsu = cutlet.Cutlet()
        return katsu.romaji(text_input)

    def tone_analyzer_api(self):
        authenticator = IAMAuthenticator('y3OpvtsXh5JF3gcKjYbpdY5FrQa30jqHCx8d5GUIXSSh')
        tone_analyzer = ToneAnalyzerV3(
            version='2017-09-21',
            authenticator=authenticator
        )
        tone_analyzer.set_service_url('https://api.au-syd.tone-analyzer.watson.cloud.ibm.com/instances/9328f9f1-e7f3-4018-a761-5156649d74c7')
        tone_analyzer.set_disable_ssl_verification(True)
        return tone_analyzer

    def speech_to_text_api(self):
        authenticator = IAMAuthenticator('D5CP-CK2qnzcpU3XexRpZ75XYJ6mXunae-Y66oIeOqCU')
        speech_to_text = SpeechToTextV1(
            authenticator=authenticator
        )
        speech_to_text.set_service_url('https://api.au-syd.speech-to-text.watson.cloud.ibm.com/instances/6def0d7a-957c-4772-9d72-9db4fecc3785')
        speech_to_text.set_disable_ssl_verification(True)
        return speech_to_text 
    
    def text_to_text_api(self):
        authenticator = IAMAuthenticator('PCksUVQHiSy6jSXXxCLtyAP1LT0wPi07P2VgCySOpCFT')
        language_translator = LanguageTranslatorV3(
            version='2018-05-01',
            authenticator=authenticator
        )

        language_translator.set_service_url('https://api.kr-seo.language-translator.watson.cloud.ibm.com/instances/9f9e3b18-5c02-48d9-b07e-80c929c9c8e8')
        language_translator.set_disable_ssl_verification(True)
        return language_translator


    def text_to_emoition(self, text_input):
        translator = translate.Client()
        text_to_emotion = translator.translate(text_input, target_language='en')
        tone_analysis = self.tone_analyzer_api().tone( {'text': text_to_emotion['translatedText']}, content_type='application/json' ).get_result()
        tone_recognize = {}
        if tone_analysis and 'sentences_tone' in tone_analysis.keys():
            for emotion in tone_analysis['sentences_tone']:
                for tones in emotion['tones']:
                    if tones['tone_id'] not in tone_recognize.keys():  tone_recognize[tones['tone_id']] = tones['score']
                    else: tone_recognize[tones['tone_id']] += tones['score']
        if tone_analysis and 'document_tone' in tone_analysis.keys():    
            for tones in tone_analysis['document_tone']['tones']:
                if tones['tone_id'] not in tone_recognize.keys():  
                    tone_recognize[tones['tone_id']] = tones['score']
                else: 
                    tone_recognize[tones['tone_id']] += tones['score']
        return tone_recognize


    def text_to_text(self, text_input):
        translate_client = translate.Client()
        
        translate_text = translate_client.translate(text_input, target_language=self.language_convert)
        return  translate_text['translatedText']

    def speech_to_text(self, speech_input):
        r = sr.Recognizer()
        with sr.AudioFile(speech_input) as source:
            audio_text = r.listen(source)
            text = r.recognize_google(audio_text)
            translator = translate.Client()
            translate_text = translator.translate(text, target_language=self.language_selected)
            print(translate_text)
            return translate_text['translatedText']
                
    def object_to_text(self, image_input):
        # image = cv2.imread(image_input, cv2.IMREAD_GRAYSCALE) 
        # plt.figure(figsize=(16,10))
        # plt.imshow(image, cmap='Greys_r')
        # data = image_input.read()
        # image = np.asarray(bytearray(data), dtype="uint8")
        # image = cv2.imdecode(image, cv2.IMREAD_COLOR)

        # extracted_text = pytesseract.image_to_string(image)
        # print(extracted_text)
        return "with my wings will fly"