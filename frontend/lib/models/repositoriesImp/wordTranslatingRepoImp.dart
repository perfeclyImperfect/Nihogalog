import 'package:frontend/models/repositories/wordTranslatingRepo.dart';
import 'package:frontend/models/wordTranslating.dart';

class WordTranslatingRepoImp extends WordTranslatingRepo {
  late WordTranslating _wordTranslating;

  @override
  WordTranslating getPrivateWT() {
    return _wordTranslating;
  }

  @override
  init() {
    _wordTranslating = WordTranslating('', '', '', false);
  }

  @override
  void setWordTranslating(WordTranslating wordTranslating) {
    _wordTranslating = wordTranslating;
  }
}
