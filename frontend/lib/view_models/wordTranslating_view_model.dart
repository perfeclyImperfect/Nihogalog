import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:frontend/models/services/wordTranslatingSer.dart';
import 'package:frontend/models/servicesImp/textToSpeechSerImp.dart';
import 'package:frontend/models/wordTranslating.dart';

class WordTranslatingViewModel extends ChangeNotifier {
  final WordTranslatingSer _wordTranslatingSer = locator<WordTranslatingSer>();
  final HistorySer _historySer = locator<HistorySer>();
  final TextToSpeechSerImp _textToSpeechSerImp = locator<TextToSpeechSerImp>();

  WordTranslating get getText => _wordTranslatingSer.getWordTranslating();

  List<bool> isSpeaking = [false, false];
  late int _index;

  WordTranslatingViewModel() {
    _init();
  }

  _init() {
    _textToSpeechSerImp.getFlutterTts.setStartHandler(() {
      isSpeaking[_index] = true;
      notifyListeners();
    });

    _textToSpeechSerImp.getFlutterTts.setCompletionHandler(() {
      isSpeaking[_index] = false;
      notifyListeners();
    });

    _textToSpeechSerImp.getFlutterTts.setErrorHandler((message) {
      isSpeaking[_index] = false;
      notifyListeners();
    });
  }

  void swap(LanguageTranslation languageTranslation) {
    WordTranslating translatedWordTranslating = _wordTranslatingSer.translate(
        WordTranslating(
          getText.translation,
          "",
          "",
          getText.favorite,
        ),
        languageTranslation);

    setText(translatedWordTranslating);
  }

  speak(String text, int index) {
    _index = index;

    _textToSpeechSerImp.speak(text);
    notifyListeners();
  }

  stop() {
    isSpeaking[_index] = false;
    _textToSpeechSerImp.stop();

    notifyListeners();
  }

  translate(String text, LanguageTranslation languageTranslation,
      bool favorite) async {
    final tempTranslation = await _wordTranslatingSer.translate(
        WordTranslating(text, "", "", favorite), languageTranslation);

    _wordTranslatingSer.setWordTranslating(tempTranslation);

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
