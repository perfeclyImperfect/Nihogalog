import 'package:flutter/material.dart';
import 'package:frontend/models/wordTranslating.dart';

class WordTranslatingViewModel extends ChangeNotifier {
  WordTranslating _text = WordTranslating('', '', '');

  WordTranslating get getText => _text;

  translate(WordTranslating text) {
    init();
  }

  init() {}

  setText(WordTranslating text) {
    _text = text;
    notifyListeners();
  }

  reset() {
    setText(WordTranslating('', '', ''));

    notifyListeners();
  }
}
