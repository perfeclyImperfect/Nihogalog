import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/config/environment.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/services/apiSer.dart';
import 'package:frontend/utils/constants.dart';

class TranslationSerImp extends ApiSer {
  static Future<Map> translate(
      String word, String fromLanguage, String toLanguage) async {
    final url = "${Environment.baseURL}/api/text-converter/";

    final dio = locator<Dio>();

    final response = await dio.post(url, data: {
      'text_input': word,
      'language_selected': kLanguageCodes[fromLanguage],
      'language_convert': kLanguageCodes[toLanguage]
    });

    print(response);

    return response.data;
  }
}
