import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/services/languageTranslationSer.dart';

import 'package:frontend/models/languageTranslation.dart';

class LanguageTranslationViewModel extends ChangeNotifier {
  final languageTranslationService = locator<LanguageTranslationSer>();

  LanguageTranslation _languageTranslation = LanguageTranslation('', '');

  LanguageTranslationViewModel() {
    init();
  }

  init() async {
    final temp = await languageTranslationService.getLanguageTranslation();

    _languageTranslation = temp;
    await setLanguageTranslation(temp);
  }

  LanguageTranslation get getLanguageTranslation => _languageTranslation;

  void swapLanguage() async {
    final temp = await languageTranslationService.swap();
    _languageTranslation = temp;

    notifyListeners();
  }

  setLanguageTranslation(LanguageTranslation languageTranslation) {
    languageTranslationService.setLanguageTranslation(languageTranslation);
    _languageTranslation = languageTranslation;

    notifyListeners();
  }

  void reset() async {
    languageTranslationService.reset();

    notifyListeners();
  }
}
