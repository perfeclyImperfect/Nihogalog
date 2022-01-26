from django.urls import path
from .views import *
urlpatterns = [
    path('emotion-detection/', emotion_detection),
    path('object_detection/', object_detection),
    path('speech-converter/', speech_converter),
    path('text-converter/', text_converter),
    path('text-detection-translator/', text_detection_translator)
]
