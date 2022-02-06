class HistoryWord {
  late String _originalWord;
  late String _translationWord;
  late bool? _favorite;

  HistoryWord(final String originalWord, final String translationWord) {
    _originalWord = originalWord;
    _translationWord = translationWord;
  }

  HistoryWord.withFavorite(
      this._originalWord, this._translationWord, this._favorite);

  HistoryWord.fromJson(Map<String, dynamic> json)
      : _originalWord = json['originalWord'],
        _translationWord = json['translationWord'];

  String get getOriginalWord => _originalWord;
  String get getTranslationWord => _translationWord;
  bool? get isFavorite => _favorite;

  void setOriginalWord(final String originalWord) {
    _originalWord = originalWord;
  }

  void setTranslationWord(final String translationWord) {
    _translationWord = translationWord;
  }

  void setFavoriteWord(final bool favorite) {
    _favorite = favorite;
  }

  Map<String, dynamic> toJson() => {
        'originalWord': _originalWord,
        'translationWord': _translationWord,
      };
}
