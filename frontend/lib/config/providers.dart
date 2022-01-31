import 'package:provider/provider.dart';
import 'package:frontend/view_models/textTranslation_view_model.dart';

getProviders() {
  return [
    ChangeNotifierProvider(
      create: (_) => TextTranslationViewModel(),
    ),
  ];
}
