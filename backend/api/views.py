import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.http import FileResponse


@csrf_exempt
def text_converter(request):
    data = json.loads(request.body.decode())
    # response_sound = FileResponse(open(
    #     'sound/example.mp3', 'rb'))
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
def speech_converter(request):
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
def emotion_detection(request):
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
def object_detection(request):
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
def text_detection_translator(request):
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
