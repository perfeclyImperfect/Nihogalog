import 'package:frontend/models/repositories/translatingRepo.dart';
import 'package:frontend/models/translating.dart';

class TranslatingRepoImp extends TranslatingRepo {
  Translating _translating = const Translating(status: false);

  @override
  Translating get getTranslating => _translating;

  @override
  void setTranslating(Translating translating) {
    _translating = translating;
  }
}
