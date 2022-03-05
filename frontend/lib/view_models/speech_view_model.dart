import 'package:flutter/cupertino.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:frontend/models/servicesImp/audioRecorderSerImp.dart';
import 'package:frontend/models/servicesImp/speechTranslationSerImp.dart';
import 'package:frontend/models/servicesImp/textToSpeechSerImp.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:provider/provider.dart';

class SpeechViewModel extends ChangeNotifier {
  final AudioRecorderServiceImp _audioRecorderServiceImp =
      locator<AudioRecorderServiceImp>();

  final SpeechTranslationSerImp _speechTranslationSerImp =
      locator<SpeechTranslationSerImp>();

  final HistorySer _historySer = locator<HistorySer>();
  final TextToSpeechSerImp _textToSpeechSerImp = locator<TextToSpeechSerImp>();

  List<bool> isSpeaking = [false, false];
  late int _index;

  bool _topAudioRecordStatus = false;
  bool _bottomAudioRecordStatus = false;

  late WordTranslating _currentWordTranslating =
      WordTranslating("", "", "", false);

  WordTranslating? get getCurrentWordTranslating => _currentWordTranslating;
  String _toCopy = '';
  String get getToCopy => _toCopy;

  bool get getBottomAudioRecordStatus => _bottomAudioRecordStatus;
  bool get getTopAudioRecordStatus => _topAudioRecordStatus;

  SpeechViewModel() {
    _init();
    notifyListeners();
  }

  toggleFavorite() {
    _currentWordTranslating.favorite = !_currentWordTranslating.favorite;

    notifyListeners();
  }

  swap() {
    final WordTranslating tempWordTranslating = WordTranslating(
      _currentWordTranslating.translation,
      _currentWordTranslating.word,
      _currentWordTranslating.translationPronounciation,
      false,
    );

    setCurrentWordTranslating(tempWordTranslating);
  }

  _init() {
    _audioRecorderServiceImp.init();

    _textToSpeechSerImp.getFlutterTts.setStartHandler(() {
      isSpeaking[_index] = true;
      notifyListeners();
    });

    _textToSpeechSerImp.getFlutterTts.setCompletionHandler(() {
      isSpeaking[_index] = false;
      notifyListeners();
    });

    _textToSpeechSerImp.getFlutterTts.setErrorHandler((message) {
      isSpeaking[_index] = false;
      notifyListeners();
    });
  }

  void setCurrentWordTranslating(WordTranslating wordTranslating) {
    _currentWordTranslating = wordTranslating;

    notifyListeners();
  }

  speak(String text, int index) {
    _index = index;

    _textToSpeechSerImp.speak(text);
    notifyListeners();
  }

  stop() {
    isSpeaking[_index] = false;
    _textToSpeechSerImp.stop();

    notifyListeners();
  }

  toggletTopRecord(context, fromLanguage, toLanguage) async {
    _topAudioRecordStatus = !_topAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();

    if (!_topAudioRecordStatus) {
      final WordTranslating tempTranslation =
          await _translate(fromLanguage, toLanguage);

      final currentText = tempTranslation.word;
      if (currentText.isNotEmpty) {
        HistoryWord tempHistoryWord = HistoryWord(
            tempTranslation.word,
            tempTranslation.translation,
            tempTranslation.translationPronounciation,
            fromLanguage,
            toLanguage,
            false);

        Provider.of<HistoryViewModel>(context, listen: false)
            .add(tempHistoryWord);

        Provider.of<WordTranslatingViewModel>(context, listen: false)
            .fromHistory(tempHistoryWord);
      }

      _toCopy = tempTranslation.translation;
      setCurrentWordTranslating(WordTranslating(tempTranslation.translation,
          tempTranslation.word, '', tempTranslation.favorite));
    }

    notifyListeners();
  }

  toggleBottomRecord(context, fromLanguage, toLanguage) async {
    _bottomAudioRecordStatus = !_bottomAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();

    if (!_bottomAudioRecordStatus) {
      final WordTranslating tempTranslation =
          await _translate(fromLanguage, toLanguage);

      final currentText = tempTranslation.word;
      if (currentText.isNotEmpty) {
        HistoryWord tempHistoryWord = HistoryWord(
            tempTranslation.word,
            tempTranslation.translation,
            tempTranslation.translationPronounciation,
            fromLanguage,
            toLanguage,
            false);

        Provider.of<HistoryViewModel>(context, listen: false)
            .add(tempHistoryWord);

        Provider.of<WordTranslatingViewModel>(context, listen: false)
            .fromHistory(tempHistoryWord);
      }

      _toCopy = tempTranslation.translation;
      setCurrentWordTranslating(tempTranslation);
    }

    notifyListeners();
  }

  _translate(fromLanguage, toLanguage) async {
    final tempTranslation = await _speechTranslationSerImp.translate(
        temporaryAudioFilename, fromLanguage, toLanguage);

    final HistoryWord tempHistoryWord = HistoryWord(
      tempTranslation['text_input'],
      tempTranslation['text_output'],
      tempTranslation['text_romaji'],
      fromLanguage,
      toLanguage,
      false,
    );

    final finalWordTranslation = await fromHistory(tempHistoryWord);

    return finalWordTranslation;
  }

  Future<WordTranslating> fromHistory(HistoryWord historyWord) async {
    final HistoryWord? tempHistoryWord = await _historySer.get(historyWord);

    if (tempHistoryWord != null) {
      historyWord.setFavoriteWord(tempHistoryWord.getFavorite ?? false);
    }

    final tempWordTranslating = WordTranslating(
      historyWord.getOriginalWord,
      historyWord.getTranslationWord,
      historyWord.getPronounciation,
      historyWord.getFavorite ?? false,
    );

    return tempWordTranslating;
  }

  reset() {
    _topAudioRecordStatus = false;
    _bottomAudioRecordStatus = false;
    _currentWordTranslating = WordTranslating('', '', '', false);
    _toCopy = '';
    isSpeaking = [false, false];

    notifyListeners();
  }
}
