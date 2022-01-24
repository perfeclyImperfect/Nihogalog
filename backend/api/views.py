import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt


@csrf_exempt
def text_converter(request):
    data = json.loads(request.body.decode())
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
def emotion_detection(request):
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
def text_detection_translator(request):
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
