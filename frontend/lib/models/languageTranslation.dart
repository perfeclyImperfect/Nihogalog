class LanguageTranslation {
  String? _fromLanguage;
  String? _toLanguage;

  LanguageTranslation(
    this._fromLanguage,
    this._toLanguage,
  );

  LanguageTranslation.fromJSON(Map<String, dynamic> json)
      : _fromLanguage = json['fromLanguage'],
        _toLanguage = json['toLanguage'];

  String? get getFromLanguage => _fromLanguage;

  void setFromLanguage(String? fromLanguage) async {
    _fromLanguage = fromLanguage;
  }

  String? get getToLanguage => _toLanguage;

  void setToLanguage(String? toLanguage) async {
    _toLanguage = toLanguage;
  }
}
