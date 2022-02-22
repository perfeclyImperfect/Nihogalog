import 'dart:io';

import 'package:dio/dio.dart';
import 'package:frontend/config/environment.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/services/apiSer.dart';
import 'package:frontend/utils/constants.dart';
import 'package:path_provider/path_provider.dart';

class SpeechTranslationSerImp extends ApiSer {
  final url = "${Environment.baseURL}/api/speech-converter/";
  final dio = locator<Dio>();

  // ignore: prefer_typing_uninitialized_variables
  late var temporaryAudioPath;

  SpeechTranslationSerImp() {
    init();
  }

  init() async {
    Directory tempDirectory = await getTemporaryDirectory();

    temporaryAudioPath = "${tempDirectory.path}/";
  }

  Future<Map> translate(
      String filename, String fromLanguage, String toLanguage) async {
    final String tempFullPath = "$temporaryAudioPath$filename";

    print("TRANSLATION FULL PATH $tempFullPath");
    final formData = FormData.fromMap({
      "language_selected": fromLanguage,
      "language_convert": toLanguage,
      "speech_input": MultipartFile.fromFile(tempFullPath, filename: filename)
    });

    final response = await dio.post(url, data: formData);

    print("test $response");

    return response.data;
  }
}
