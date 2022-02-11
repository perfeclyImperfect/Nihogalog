import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/wordTranslating.dart';

abstract class WordTranslatingSer {
  WordTranslating getWordTranslating();
  void setWordTranslating(WordTranslating wordTranslating);

  translate(WordTranslating text, LanguageTranslation languageTranslation);
  void reset();
}
