class WordTranslating {
  WordTranslating(this.word, this.translation, this.translationPronounciation,
      this.favorite);

  final String word;
  final String translation;
  final String translationPronounciation;
  bool favorite;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'word': word,
      'translation': translation,
      'translationPronounciation': translationPronounciation,
      "favorite": favorite
    };

    return json;
  }
}
