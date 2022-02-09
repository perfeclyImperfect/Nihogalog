import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/services/translatingSer.dart';
import 'package:frontend/models/translating.dart';

class TranslatingViewModel extends ChangeNotifier {
  TranslatingSer translatingSer = locator<TranslatingSer>();

  Translating _translating = const Translating(status: false);

  Translating get getTranslating => _translating;

  setTranslating(Translating translating) {
    _translating = translating;
    notifyListeners();
  }

  reset() {
    _translating = translatingSer.reset();

    notifyListeners();
  }
}
