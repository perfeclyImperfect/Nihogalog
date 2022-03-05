import 'dart:io';

import 'package:dio/dio.dart';
import 'package:frontend/config/environment.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/services/apiSer.dart';
import 'package:frontend/utils/constants.dart';
import 'package:path_provider/path_provider.dart';

class SpeechTranslationSerImp extends ApiSer {
  final _url = "${Environment.baseURL}/api/speech-converter/";
  final _dio = locator<Dio>();

  // ignore: prefer_typing_uninitialized_variables
  late var _temporaryAudioPath;

  SpeechTranslationSerImp() {
    init();
  }

  init() async {
    Directory tempDirectory = await getTemporaryDirectory();

    _temporaryAudioPath = "${tempDirectory.path}/";
  }

  Future<Map> translate(
      String filename, String fromLanguage, String toLanguage) async {
    final String tempFullPath = "$_temporaryAudioPath$temporaryAudioFilename";

    final formData = FormData.fromMap({
      "language_selected": kLanguageCodes[fromLanguage],
      "language_convert": kLanguageCodes[toLanguage],
      "speech_input": await MultipartFile.fromFile(tempFullPath,
          filename: temporaryAudioFilename)
    });

    // final FormData = ;

    final response = await _dio.post(_url, data: formData);

    return response.data;
    // return {
    //   "text_output": 'test',
    //   'text_input': 'of course',
    //   'text_romaji': 'anu bayan'
    // };
  }
}
