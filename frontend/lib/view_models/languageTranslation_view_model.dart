import 'package:flutter/material.dart';
import 'package:frontend/config/locator.dart';
import 'package:frontend/models/services/languageTranslationService.dart';

import 'package:frontend/models/languageTranslation.dart';

class LanguageTranslationViewModel extends ChangeNotifier {
  final languageTranslationService = locator<LanguageTranslationSer>();

  late LanguageTranslation _languageTranslation = LanguageTranslation('', '');

  LanguageTranslationViewModel() {
    init();
  }

  init() async {
    final temp = await languageTranslationService.getLanguageTranslation();

    await setLanguageTranslation(temp);

    notifyListeners();
  }

  LanguageTranslation get getLanguageTranslation => _languageTranslation;

  void swapLanguage() async {
    _languageTranslation = await languageTranslationService.swap();

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
