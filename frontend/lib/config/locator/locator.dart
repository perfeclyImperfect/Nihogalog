import 'package:dio/dio.dart';
import 'package:frontend/models/repositories/darkModeRepo.dart';
import 'package:frontend/models/repositories/historyRepo.dart';
import 'package:frontend/models/repositories/languageTranslationRepo.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:frontend/models/repositories/translatingRepo.dart';
import 'package:frontend/models/repositories/wordTranslatingRepo.dart';
import 'package:frontend/models/repositoriesImp/darkModeRepoImp.dart';
import 'package:frontend/models/repositoriesImp/historyRepoImp.dart';
import 'package:frontend/models/repositoriesImp/languageTranslationRepoImp.dart';
import 'package:frontend/models/repositoriesImp/sharedPreferencesRepoImp.dart';
import 'package:frontend/models/repositoriesImp/translatingRepoImp.dart';
import 'package:frontend/models/repositoriesImp/wordTranslatingRepoImp.dart';
import 'package:frontend/models/services/darkModeSer.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:frontend/models/services/languageTranslationSer.dart';
import 'package:frontend/models/services/translatingSer.dart';
import 'package:frontend/models/services/wordTranslatingSer.dart';
import 'package:frontend/models/servicesImp/audioRecorderSerImp.dart';
import 'package:frontend/models/servicesImp/darkModeServiceImp.dart';
import 'package:frontend/models/servicesImp/historySerImp.dart';
import 'package:frontend/models/servicesImp/languageTranslationSerImp.dart';
import 'package:frontend/models/servicesImp/speechTranslationSerImp.dart';
import 'package:frontend/models/servicesImp/textToSpeechSerImp.dart';
import 'package:frontend/models/servicesImp/translatingSerImp.dart';
import 'package:frontend/models/servicesImp/textTranslationSerImp.dart';
import 'package:frontend/models/servicesImp/wordTranslatingSerImp.dart';

import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;

void getItSetup() {
  locator.registerLazySingleton<SharedPreferencesRepo>(
      () => SharedPreferencesRepoImp());

  // Repositories
  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<LanguageTranslationRepo>(
      () => LanguageTranslationRepoImp(locator()));

  locator.registerLazySingleton<DarkModeRepo>(() => DarkModeRepoImp(locator()));

  locator.registerLazySingleton<TranslatingRepo>(() => TranslatingRepoImp());
  locator.registerLazySingleton<HistoryRepo>(() => HistoryRepoImp(locator()));
  locator.registerLazySingleton<WordTranslatingRepo>(
      () => WordTranslatingRepoImp());

  // Services

  locator.registerLazySingleton<LanguageTranslationSer>(
      () => LanguageTranslationSerImp(locator()));

  locator.registerLazySingleton<DarkModeSer>(() => DarkModeSerImp(locator()));

  locator.registerLazySingleton<TranslatingSer>(
      () => TranslatingSerImp(locator()));
  locator.registerLazySingleton<HistorySer>(() => HistorySerImp(locator()));

  locator.registerLazySingleton<WordTranslatingSer>(
      () => WordTranslatingSerImp(locator()));

  locator.registerLazySingleton<AudioRecorderServiceImp>(
      () => AudioRecorderServiceImp());

  locator.registerLazySingleton<TextTranslationSerImp>(
      () => TextTranslationSerImp());

  locator.registerLazySingleton<SpeechTranslationSerImp>(
      () => SpeechTranslationSerImp());

  locator.registerLazySingleton<TextToSpeechSerImp>(() => TextToSpeechSerImp());

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
