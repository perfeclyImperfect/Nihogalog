import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/repositories/languageTranslationRepo.dart';
import 'package:frontend/models/services/languageTranslationSer.dart';
import 'package:frontend/utils/constants.dart';

class LanguageTranslationSerImp extends LanguageTranslationSer {
  LanguageTranslationRepo languageTranslationRepository;

  LanguageTranslationSerImp(this.languageTranslationRepository);

  @override
  Future<LanguageTranslation> getLanguageTranslation() async {
    return await languageTranslationRepository.getLanguageTranslation ??
        LanguageTranslation(kDefaultFromLanguage, kDefaultToLanguage);
  }

  @override
  void setLanguageTranslation(LanguageTranslation languageTranslation) async {
    languageTranslationRepository.setLanguageTranslation(languageTranslation);
  }

  @override
  Future<LanguageTranslation> swap() async {
    final LanguageTranslation? temp =
        await languageTranslationRepository.getLanguageTranslation;

    LanguageTranslation? languageTranslation;

    if (temp != null) {
      languageTranslation =
          LanguageTranslation(temp.getToLanguage, temp.getFromLanguage);
    } else {
      languageTranslation =
          LanguageTranslation(kDefaultFromLanguage, kDefaultToLanguage);
    }

    setLanguageTranslation(languageTranslation);

    return languageTranslation;
  }

  @override
  Future<LanguageTranslation> reset() async {
    print('resetting');
    return LanguageTranslation('', '');
  }
}
