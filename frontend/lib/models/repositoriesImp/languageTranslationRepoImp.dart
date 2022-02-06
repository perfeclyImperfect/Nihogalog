import 'dart:convert';

import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/repositories/languageTranslationRepo.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageTranslationRepoImp extends LanguageTranslationRepo {
  SharedPreferencesRepo sharedPreferencesRepo;

  final String _key = 'language';

  LanguageTranslationRepoImp(this.sharedPreferencesRepo) : super();

  @override
  init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    final String? tempString = await sharedPreferencesRepo.getString(_key);

    LanguageTranslation tempLanguageTranslation;

    if (tempString == null) {
      final Map<String, dynamic> defaultValues = {
        'fromLanguage': 'Tagalog',
        'toLanguage': 'Nihongo',
      };

      sharedPreferencesRepo.setString(_key, jsonEncode(defaultValues));

      tempLanguageTranslation = LanguageTranslation.fromJSON(defaultValues);
    } else {
      final Map<String, dynamic> temp = jsonDecode(tempString);

      tempLanguageTranslation = LanguageTranslation.fromJSON(
        {
          'fromLanguage': temp['fromLanguage'],
          'toLanguage': temp['toLanguage']
        },
      );
    }

    setLanguageTranslation(tempLanguageTranslation);
  }

  @override
  void setLanguageTranslation(LanguageTranslation languageTranslation) async {
    sharedPreferencesRepo.setString(
        _key,
        jsonEncode({
          'fromLanguage': languageTranslation.getFromLanguage,
          'toLanguage': languageTranslation.getToLanguage
        }));
  }

  @override
  getPrivateLT() async {
    String? tempString = await sharedPreferencesRepo.getString(_key);

    if (tempString != null) {
      final decodedJSON = jsonDecode(tempString);

      return LanguageTranslation(
        decodedJSON['fromLanguage'],
        decodedJSON['toLanguage'],
      );
    }

    return throw Exception('Error ');
  }
}
