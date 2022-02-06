import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/repositories/languageTranslationRepo.dart';
import 'package:frontend/models/services/languageTranslationService.dart';

class LanguageTranslationSerImp extends LanguageTranslationSer {
  LanguageTranslationRepo languageTranslationRepository;

  LanguageTranslationSerImp(this.languageTranslationRepository);

  @override
  Future<LanguageTranslation> getLanguageTranslation() async {
    return await languageTranslationRepository.getLanguageTranslation;
  }

  @override
  void setLanguageTranslation(LanguageTranslation languageTranslation) async {
    await languageTranslationRepository
        .setLanguageTranslation(languageTranslation);
  }

  @override
  swap() async {
    final LanguageTranslation temp =
        await languageTranslationRepository.getLanguageTranslation;

    LanguageTranslation languageTranslation =
        LanguageTranslation(temp.getToLanguage, temp.getFromLanguage);

    setLanguageTranslation(languageTranslation);

    return languageTranslation;
  }

  @override
  reset() {
    print('resetting');
  }
}
