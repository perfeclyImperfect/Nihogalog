import 'package:frontend/models/wordTranslating.dart';

abstract class WordTranslatingRepo {
  void setWordTranslating(WordTranslating wordTranslating);
  WordTranslating get getWordTranslating => getPrivateWT();

  WordTranslatingRepo() {
    init();
  }

  init();

  WordTranslating getPrivateWT();
}
