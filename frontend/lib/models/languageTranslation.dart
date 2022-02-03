import 'package:shared_preferences/shared_preferences.dart';

class LanguageTranslation {
  late SharedPreferences _localStorage;

  final String _kFromLanguageKey = 'fromLanguage';
  final String _kToLanguageKey = 'toLanguage';

  Future<void> setFromLanguage(value) async {
    _localStorage = await SharedPreferences.getInstance();

    await _localStorage.setString(_kFromLanguageKey, value);
  }

  Future<void> setToLanguage(value) async {
    _localStorage = await SharedPreferences.getInstance();

    await _localStorage.setString(_kToLanguageKey, value);
  }

  Future<String> getFromLanguage() async {
    _localStorage = await SharedPreferences.getInstance();

    String? fromLanguageKey = _localStorage.getString(_kFromLanguageKey);

    if (fromLanguageKey == null) {
      const defaultValue = 'Tagalog';
      setFromLanguage(defaultValue);
      fromLanguageKey = defaultValue;
    }

    return fromLanguageKey;
  }

  Future<String> getToLanguage() async {
    _localStorage = await SharedPreferences.getInstance();

    String? toLanguageKey = _localStorage.getString(_kToLanguageKey);

    if (toLanguageKey == null) {
      const defaultValue = 'Nihogalog';

      setToLanguage(defaultValue);
      toLanguageKey = defaultValue;
    }

    return toLanguageKey;
  }
}
