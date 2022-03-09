from django.urls import path
from .views import *
urlpatterns = [
    path('object-detection/', object_detection),
    path('image-detection/', image_detection),
    path('text-detection/', text_detection),
    path('speech-converter/', speech_converter),
    path('text-converter/', text_converter),
]
