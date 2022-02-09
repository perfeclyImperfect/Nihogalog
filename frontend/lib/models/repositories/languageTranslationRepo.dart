import 'package:frontend/models/languageTranslation.dart';

abstract class LanguageTranslationRepo {
  void setLanguageTranslation(LanguageTranslation languageTranslation);
  Future<LanguageTranslation?> get getLanguageTranslation => getPrivateLT();

  LanguageTranslationRepo() {
    init();
  }

  void init();
  Future<LanguageTranslation?> getPrivateLT();
}
