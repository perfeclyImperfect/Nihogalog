import 'package:frontend/models/languageTranslation.dart';

abstract class LanguageTranslationSer {
  Future<LanguageTranslation> getLanguageTranslation();
  void setLanguageTranslation(LanguageTranslation languageTranslation);

  Future<LanguageTranslation> swap();
  Future<LanguageTranslation> reset();
}
