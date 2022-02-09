import 'package:frontend/models/repositories/translatingRepo.dart';
import 'package:frontend/models/services/translatingSer.dart';
import 'package:frontend/models/translating.dart';

class TranslatingSerImp extends TranslatingSer {
  TranslatingRepo translatingRepo;

  TranslatingSerImp(this.translatingRepo);

  @override
  Translating getTranslating() {
    return translatingRepo.getTranslating;
  }

  @override
  Translating reset() {
    Translating resetTranslating = const Translating(status: false);
    translatingRepo.setTranslating(resetTranslating);

    return resetTranslating;
  }
}
