class WordTranslating {
  WordTranslating(this.word, this.translation, this.translationPronounciation);

  final String word;
  final String translation;
  final String translationPronounciation;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'word': word,
      'translation': translation,
      'translationPronounciation': translationPronounciation,
    };

    return json;
  }
}
