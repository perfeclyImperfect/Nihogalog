import 'package:frontend/models/repositories/darkModeRepo.dart';
import 'package:frontend/models/repositories/historyRep.dart';
import 'package:frontend/models/repositories/languageTranslationRepo.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:frontend/models/repositories/translatingRepo.dart';
import 'package:frontend/models/repositoriesImp/darkModeRepoImp.dart';
import 'package:frontend/models/repositoriesImp/historyRepImp.dart';
import 'package:frontend/models/repositoriesImp/languageTranslationRepoImp.dart';
import 'package:frontend/models/repositoriesImp/sharedPreferencesRepoImp.dart';
import 'package:frontend/models/repositoriesImp/translatingRepoImp.dart';
import 'package:frontend/models/services/darkModeSer.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:frontend/models/services/languageTranslationSer.dart';
import 'package:frontend/models/services/translatingSer.dart';
import 'package:frontend/models/servicesImp/darkModeServiceImp.dart';
import 'package:frontend/models/servicesImp/historySerImp.dart';
import 'package:frontend/models/servicesImp/languageTranslationSerImp.dart';
import 'package:frontend/models/servicesImp/translatingSerImp.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;

void setup() {
  locator.registerLazySingleton<SharedPreferencesRepo>(
      () => SharedPreferencesRepoImp());

  // Repositories

  locator.registerLazySingleton<LanguageTranslationRepo>(
      () => LanguageTranslationRepoImp(locator()));

  locator.registerLazySingleton<DarkModeRepo>(() => DarkModeRepoImp(locator()));

  locator.registerLazySingleton<TranslatingRepo>(() => TranslatingRepoImp());
  locator.registerLazySingleton<HistoryRep>(() => HistoryRepImp(locator()));

  // Services

  locator.registerLazySingleton<LanguageTranslationSer>(
      () => LanguageTranslationSerImp(locator()));

  locator.registerLazySingleton<DarkModeSer>(() => DarkModeSerImp(locator()));

  locator.registerLazySingleton<TranslatingSer>(
      () => TranslatingSerImp(locator()));
  locator.registerLazySingleton<HistorySer>(() => HistorySerImp(locator()));

  // ViewModels

  // locator.registerLazySingleton<DarkModeViewModel>(
  //     () => Provider.of<DarkModeViewModel>(locator()));
  // locator.registerLazySingleton<TranslatingViewModel>(
  //     () => TranslatingViewModel());
  // locator.registerLazySingleton<TextTranslationViewModel>(
  //     () => TextTranslationViewModel());
  // locator.registerLazySingleton<HistoryViewModel>(
  //     () => Provider.of<HistoryViewModel>(context));
}
