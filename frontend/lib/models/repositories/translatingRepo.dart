import 'package:frontend/models/translating.dart';

abstract class TranslatingRepo {
  Translating get getTranslating;
  void setTranslating(Translating translating);
}
