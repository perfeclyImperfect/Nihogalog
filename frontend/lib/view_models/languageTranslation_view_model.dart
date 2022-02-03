import 'package:flutter/material.dart';
import 'package:frontend/models/languageTranslation.dart';

class LanguageTranslationViewModel extends ChangeNotifier {
  final LanguageTranslation _languageTranslation = LanguageTranslation();

  LanguageTranslationViewModel() {
    init();
  }

  String _fromLanguage = '';
  String _toLanguage = '';

  get getFromLanguage => _fromLanguage;
  get getToLanguage => _toLanguage;

  init() async {
    _fromLanguage = await _languageTranslation.getFromLanguage();
    _toLanguage = await _languageTranslation.getToLanguage();
    notifyListeners();
  }

  void swapLanguage() async {
    final temp = getFromLanguage;

    await setFromLanguage(getToLanguage);
    await setToLanguage(temp);
    notifyListeners();
  }

  Future<void> setFromLanguage(String value) async {
    await _languageTranslation.setFromLanguage(value);
    _fromLanguage = value;
  }

  Future<void> setToLanguage(String value) async {
    await _languageTranslation.setToLanguage(value);
    _toLanguage = value;
  }
}
