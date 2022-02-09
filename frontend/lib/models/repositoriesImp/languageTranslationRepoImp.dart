import 'dart:convert';

import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/repositories/languageTranslationRepo.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:frontend/utils/constants.dart';

class LanguageTranslationRepoImp extends LanguageTranslationRepo {
  SharedPreferencesRepo sharedPreferencesRepo;

  final String _key = 'language';

  LanguageTranslationRepoImp(this.sharedPreferencesRepo) : super();

  @override
  init() async {
    LanguageTranslation? tempLanguageTranslation = await getLanguageTranslation;

    if (tempLanguageTranslation == null) {
      final Map<String, dynamic> defaultValues = {
        'fromLanguage': kDefaultFromLanguage,
        'toLanguage': kDefaultToLanguage,
      };

      sharedPreferencesRepo.setString(_key, jsonEncode(defaultValues));

      tempLanguageTranslation = LanguageTranslation.fromJSON(defaultValues);
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
  Future<LanguageTranslation?> getPrivateLT() async {
    String? tempString = await sharedPreferencesRepo.getString(_key);

    if (tempString != null) {
      final decodedJSON = jsonDecode(tempString);

      return LanguageTranslation(
        decodedJSON['fromLanguage'],
        decodedJSON['toLanguage'],
      );
    }

    return null;
  }
}
