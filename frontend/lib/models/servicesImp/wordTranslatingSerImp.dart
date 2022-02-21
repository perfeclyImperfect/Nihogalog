import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/repositories/wordTranslatingRepo.dart';
import 'package:frontend/models/services/wordTranslatingSer.dart';
import 'package:frontend/models/servicesImp/textTranslationSerImp.dart';
import 'package:frontend/models/wordTranslating.dart';

import '../languageTranslation.dart';

class WordTranslatingSerImp extends WordTranslatingSer {
  final WordTranslatingRepo wordTranslatingRepo;

  final TextTranslationSerImp _translationSerImp =
      locator<TextTranslationSerImp>();

  WordTranslatingSerImp(this.wordTranslatingRepo);

  @override
  WordTranslating getWordTranslating() {
    return wordTranslatingRepo.getWordTranslating;
  }

  @override
  void setWordTranslating(WordTranslating wordTranslating) {
    wordTranslatingRepo.setWordTranslating(wordTranslating);
  }

  @override
  translate(
      WordTranslating text, LanguageTranslation languageTranslation) async {
    final translation = await _translationSerImp.translate(
        text.word,
        languageTranslation.getFromLanguage ?? 'Tagalog',
        languageTranslation.getToLanguage ?? 'Nihogalog');

    return WordTranslating(text.word, translation['text_output'],
        translation['text_romaji'], text.favorite);
  }

  @override
  void reset() {
    setWordTranslating(WordTranslating('', '', '', false));
  }
}
