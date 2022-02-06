import 'package:frontend/models/repositories/languageTranslationRepo.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:frontend/models/repositoriesImp/languageTranslationRepoImp.dart';
import 'package:frontend/models/repositoriesImp/sharedPreferencesRepoImp.dart';
import 'package:frontend/models/services/languageTranslationService.dart';
import 'package:frontend/models/servicesImp/languageTranslationSerImp.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;

void setup() {
  locator.registerLazySingleton<SharedPreferencesRepo>(
      () => SharedPreferencesRepoImp());

  // Repositories

  locator.registerLazySingleton<LanguageTranslationRepo>(
      () => LanguageTranslationRepoImp(locator()));

  // Services

  locator.registerLazySingleton<LanguageTranslationSer>(
      () => LanguageTranslationSerImp(locator()));
}
