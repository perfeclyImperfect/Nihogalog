import 'package:flutter/material.dart';
import 'package:frontend/models/translating.dart';

class TranslatingViewModel extends ChangeNotifier {
  Translating _translating = const Translating(status: false);

  Translating get getTranslating => _translating;

  setTranslating(Translating translating) {
    _translating = translating;
    notifyListeners();
  }

  reset() {
    setTranslating(const Translating(status: false));
  }
}
