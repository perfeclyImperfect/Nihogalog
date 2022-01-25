from django.urls import path
from .views import *
urlpatterns = [
    path('text-converter/', text_converter),
    path('speech-converter/', speech_converter),
    path('emotion-detection/', emotion_detection),
    path('object_detection/', object_detection),
    path('text-detection-translator/', text_detection_translator)
]
