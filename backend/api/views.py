import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.http import FileResponse
from .forms import UploadFileForm
from .controller.object_detection_controller import *
from .controller.speech_converter_controller import *
from .controller.text_converter_controller import *


@csrf_exempt
def object_detection(request):
    data = json.loads(request.body.decode())
    convert = object_detection_controller(
        image_input=data['image_input'],
        language_selected=data['language_selected'],
        language_convert=data['language_convert']
    )
    return JsonResponse(
        {
            'success': True,
            'language_selected': convert.language_selected,
            'language_convert': convert.language_convert,
            'text_input': convert.text_input,
            'text_output': convert.text_output,
        }
    )


@csrf_exempt
def speech_converter(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        convert = speech_converter_controller(
            speech_input=request.FILES['speech_input'],
            language_selected=request.POST['language_selected'],
            language_convert=request.POST['language_convert']
        )

        return JsonResponse(
            {
                'success': True,
                'language_selected': convert.language_selected,
                'language_convert': convert.language_convert,
                'text_input': convert.text_input,
                'text_output': convert.text_output,
                'text_emotion': convert.text_emotion ,
                'text_romaji': convert.text_romaji,
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
    return JsonResponse(
        {
            'success': True,
            'language_selected': convert.language_selected,
            'language_convert': convert.language_convert,
            'text_input': convert.text_input,
            'text_output': convert.text_output,
            'text_romaji': convert.text_romaji,
            'text_emotion': convert.text_emotion ,
        }
    )



