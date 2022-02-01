import 'package:flutter/material.dart';
import 'package:frontend/models/textTranslation.dart';

class TextTranslationViewModel extends ChangeNotifier {
  TextTranslation _text = TextTranslation(text: '');

  TextTranslation get getText => _text;

  setText(TextTranslation text) {
    _text = text;
    notifyListeners();
  }
}
