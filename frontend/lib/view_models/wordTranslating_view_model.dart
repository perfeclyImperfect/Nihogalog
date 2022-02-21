import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:frontend/models/services/wordTranslatingSer.dart';
import 'package:frontend/models/servicesImp/translationSerImp.dart';
import 'package:frontend/models/wordTranslating.dart';

class WordTranslatingViewModel extends ChangeNotifier {
  final WordTranslatingSer _wordTranslatingSer = locator<WordTranslatingSer>();
  final HistorySer _historySer = locator<HistorySer>();

  WordTranslating get getText => _wordTranslatingSer.getWordTranslating();

  translate(String text, LanguageTranslation languageTranslation,
      bool favorite) async {
    final tempTranslation = await TranslationSerImp.translate(
        text,
        languageTranslation.getFromLanguage ?? 'Tagalog',
        languageTranslation.getToLanguage ?? 'Nihongo');

    _wordTranslatingSer.setWordTranslating(
      WordTranslating(text, tempTranslation['text_output'],
          tempTranslation['text_romaji'], favorite),
    );

    notifyListeners();
  }

  fromHistory(HistoryWord historyWord) async {
    final HistoryWord? tempHistoryWord = await _historySer.get(historyWord);

    if (tempHistoryWord != null) {
      historyWord.setFavoriteWord(tempHistoryWord.getFavorite ?? false);
    }

    final tempWordTranslating = WordTranslating(
      historyWord.getOriginalWord,
      historyWord.getTranslationWord,
      historyWord.getPronounciation,
      historyWord.getFavorite ?? false,
    );

    setText(tempWordTranslating);
  }

  setText(WordTranslating text) {
    _wordTranslatingSer.setWordTranslating(text);

    notifyListeners();
  }

  toggleFavorite() {
    _wordTranslatingSer.getWordTranslating().favorite =
        !_wordTranslatingSer.getWordTranslating().favorite;

    notifyListeners();
  }

  reset() {
    _wordTranslatingSer.reset();

    notifyListeners();
  }
}
