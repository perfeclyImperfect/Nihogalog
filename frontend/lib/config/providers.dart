import 'package:frontend/view_models/darkMode_view_model.dart';
import 'package:frontend/view_models/languageTranslation_view_model.dart';
import 'package:frontend/view_models/translating_view_%20model.dart';
import 'package:frontend/view_models/textTranslation_view_model.dart';

import 'package:provider/provider.dart';

getProviders() {
  return [
    ChangeNotifierProvider(
      create: (_) => TextTranslationViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => TranslatingViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => DarkModeViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => LanguageTranslationViewModel(),
    )
  ];
}
