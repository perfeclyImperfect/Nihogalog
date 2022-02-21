from django.urls import path
from .views import *
urlpatterns = [
    path('object_detection/', object_detection),
    path('speech-converter/', speech_converter),
    path('text-converter/', text_converter),
]
