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

    var formData = FormData();

    formData.files.addAll([
      MapEntry(
        'speech_input',
        MultipartFile.fromFileSync(tempFullPath,
            filename: temporaryAudioFilename),
      ),
      MapEntry('language_selected',
          MultipartFile.fromString(kLanguageCodes[fromLanguage] ?? 'tl')),
      MapEntry('language_convert',
          MultipartFile.fromString(kLanguageCodes[toLanguage] ?? "ja")),
    ]);

    final response = await dio.post(url, data: formData);

    return response.data;
  }
}
