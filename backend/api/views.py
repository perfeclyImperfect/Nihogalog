import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.http import FileResponse

from .controller.emotion_detection_controller import *
from .controller.object_detection_controller import *
from .controller.speech_converter_controller import *
from .controller.text_converter_controller import *
from .controller.text_detection_translator_controller import *


@csrf_exempt
def emotion_detection(request):
    data = json.loads(request.body.decode())

    convert = emotion_detection_controller(
        image_input=data['image_input'],
        language_selected=data['language_selected'],
        language_convert=data['language_convert']
    )
    convert.main()

    return JsonResponse(
        {
            'success': True,
            'text_input': "Text input",
            'language_selected': "Japanese",
            'language_convert': "Tagalog",
            'text_output': "Japanese",
            'speech_output': "dir"
        }
    )


@csrf_exempt
def object_detection(request):
    data = json.loads(request.body.decode())
    convert = object_detection_controller(
        image_input=data['image_input'],
        language_selected=data['language_selected'],
        language_convert=data['language_convert']
    )
    convert.main()
    return JsonResponse(
        {
            'success': True,
            'text_input': "Text input",
            'language_selected': "Japanese",
            'language_convert': "Tagalog",
            'text_output': "Japanese",
            'speech_output': "dir"
        }
    )


@csrf_exempt
def speech_converter(request):
    data = json.loads(request.body.decode())
    convert = speech_converter_controller(
        speech_input=data['speech_input'],
        language_selected=data['language_selected'],
        language_convert=data['language_convert']
    )
    convert.main()
    return JsonResponse(
        {
            'success': True,
            'text_input': "Text input",
            'language_selected': "Japanese",
            'language_convert': "Tagalog",
            'text_output': "Japanese",
            'speech_output': "dir"
        }
    )


@csrf_exempt
def text_converter(request):
    data = json.loads(request.body.decode())
    convert = text_converter_controller(
        text_input=data['text_input'],
        language_selected=data['language_selected'],
        language_convert=data['language_convert']
    )
    convert.main()
    return JsonResponse(
        {
            'success': True,
            'text_input': "Text input",
            'language_selected': "Japanese",
            'language_convert': "Tagalog",
            'text_output': "Japanese",
            'speech_output': "Response"
        }
    )


@csrf_exempt
def text_detection_translator(request):
    data = json.loads(request.body.decode())
    convert = text_detection_translator_controller(
        image_input=data['image_input'],
        language_selected=data['language_selected'],
        language_convert=data['language_convert']
    )
    convert.main()
    return JsonResponse(
        {
            'success': True,
            'text_input': "Text input",
            'language_selected': "Japanese",
            'language_convert': "Tagalog",
            'text_output': "Japanese",
            'speech_output': "dir"
        }
    )
