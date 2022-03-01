import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechSerImp {
  final FlutterTts _flutterTts = FlutterTts();

  FlutterTts get getFlutterTts => _flutterTts;

  TextToSpeechSerImp() {
    _init();
  }

  void _init() {
    // _flutterTts.setStartHandler(() {});
    // _flutterTts.setCompletionHandler(() {});
    // _flutterTts.setErrorHandler((message) {});
  }

  void speak(String? text) async {
    if (text != null && text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  void stop() async {
    await _flutterTts.stop();
  }
}
