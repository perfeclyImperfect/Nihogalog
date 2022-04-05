import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechSerImp {
  final FlutterTts _flutterTts = FlutterTts();

  FlutterTts get getFlutterTts => _flutterTts;

  void speak(String? text) async {
    if (text != null && text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  void stop() async {
    await _flutterTts.stop();
  }
}
