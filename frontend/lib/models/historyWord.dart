class HistoryWord {
  late String _originalWord;
  late String _translationWord;
  late String _fromLanguage;
  late String _toLanguage;
  late bool? _favorite;

  HistoryWord(this._originalWord, this._translationWord, this._fromLanguage,
      this._toLanguage, this._favorite);

  HistoryWord.fromJson(Map<String, dynamic> json) {
    _originalWord = json['originalWord'];
    _translationWord = json['translationWord'];
    _fromLanguage = json['fromLanguage'];
    _toLanguage = json['toLanguage'];
    _favorite = false;
  }

  String get getOriginalWord => _originalWord;
  String get getTranslationWord => _translationWord;
  String get getFromLanguage => _fromLanguage;
  String get getToLanguage => _toLanguage;
  bool? get getFavorite => _favorite;

  void setOriginalWord(final String originalWord) {
    _originalWord = originalWord;
  }

  void setTranslationWord(final String translationWord) {
    _translationWord = translationWord;
  }

  void setFavoriteWord(final bool favorite) {
    _favorite = favorite;
  }

  void setFromLanguage(final String fromLanguage) {
    _fromLanguage = fromLanguage;
  }

  void setToLanguage(final String toLanguage) {
    _toLanguage = toLanguage;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'originalWord': _originalWord,
      'translationWord': _translationWord,
      'fromLanguage': _fromLanguage,
      'toLanguage': _toLanguage,
      'favorite': _favorite
    };

    return json;
  }

  bool compare(HistoryWord historyWord) {
    if (_originalWord.compareTo(historyWord.getOriginalWord) == 0 &&
        _translationWord.compareTo(historyWord.getTranslationWord) == 0 &&
        _fromLanguage.compareTo(historyWord.getFromLanguage) == 0 &&
        _toLanguage.compareTo(historyWord.getToLanguage) == 0) {
      return true;
    }

    return false;
  }
}
