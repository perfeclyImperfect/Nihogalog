import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/services/wordTranslatingSer.dart';
import 'package:frontend/models/wordTranslating.dart';

class WordTranslatingViewModel extends ChangeNotifier {
  WordTranslatingSer wordTranslatingSer = locator<WordTranslatingSer>();

  WordTranslating get getText => wordTranslatingSer.getWordTranslating();

  translate(String text, LanguageTranslation languageTranslation) async {
    wordTranslatingSer.setWordTranslating(
      WordTranslating(text, 'translation', 'translationPronounciation'),
    );

    notifyListeners();
  }

  setText(WordTranslating text) {
    wordTranslatingSer.setWordTranslating(text);

    notifyListeners();
  }

  reset() {
    wordTranslatingSer.reset();

    notifyListeners();
  }
}
