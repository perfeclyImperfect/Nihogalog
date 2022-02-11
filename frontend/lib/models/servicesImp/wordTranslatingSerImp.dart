import 'package:frontend/models/repositories/wordTranslatingRepo.dart';
import 'package:frontend/models/services/wordTranslatingSer.dart';
import 'package:frontend/models/servicesImp/translationSerImp.dart';
import 'package:frontend/models/wordTranslating.dart';

import '../languageTranslation.dart';

class WordTranslatingSerImp extends WordTranslatingSer {
  final WordTranslatingRepo wordTranslatingRepo;

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
    // final String translation = await TranslationSerImp.translate(
    //     text.word,
    //     languageTranslation.getFromLanguage ?? 'Tagalog',
    //     languageTranslation.getToLanguage ?? 'Nihogalog');

    return WordTranslating(text.word, '', '');
  }

  @override
  void reset() {
    setWordTranslating(WordTranslating('', '', ''));
  }
}
