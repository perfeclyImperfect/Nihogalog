import 'package:flutter/cupertino.dart';
import 'package:frontend/view_models/translating_view_%20model.dart';
import 'package:provider/provider.dart';
import 'package:frontend/view_models/textTranslation_view_model.dart';

getProviders() {
  return [
    ChangeNotifierProvider(
      create: (_) => TextTranslationViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => TranslatingViewModel(),
    )
  ];
}
