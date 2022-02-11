import 'dart:convert';

import 'package:frontend/config/environment.dart';
import 'package:frontend/models/services/apiSer.dart';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart' as http;

class TranslationSerImp extends ApiSer {
  static Future<String> translate(
    String word,
    String fromLanguage,
    String toLanguage,
  ) async {
    final url = Uri.parse("${Environment.baseURL}/api/text-converter/");

    final response = await http.post(url, body: {
      'text-input': word,
      'language_selected': kLanguageCodes[fromLanguage],
      'language_convert': kLanguageCodes[toLanguage]
    });

    return jsonDecode(response.body)['text_output'];
  }
}
