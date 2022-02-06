import 'package:frontend/models/languageTranslation.dart';

abstract class LanguageTranslationSer {
  Future<LanguageTranslation> getLanguageTranslation();
  void setLanguageTranslation(LanguageTranslation languageTranslation);

  swap();
  reset();
}
