import 'package:frontend/models/languageTranslation.dart';

abstract class LanguageTranslationRepo {
  setLanguageTranslation(LanguageTranslation languageTranslation);
  Future<LanguageTranslation> get getLanguageTranslation => getPrivateLT();

  LanguageTranslationRepo() {
    init();
  }

  void init();
  Future<LanguageTranslation> getPrivateLT();
}
