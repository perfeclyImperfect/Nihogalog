import 'package:flutter/cupertino.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:frontend/models/servicesImp/audioRecorderSerImp.dart';
import 'package:frontend/models/servicesImp/speechTranslationSerImp.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/utils/constants.dart';

class SpeechViewModel extends ChangeNotifier {
  final AudioRecorderServiceImp _audioRecorderServiceImp =
      locator<AudioRecorderServiceImp>();

  final SpeechTranslationSerImp _speechTranslationSerImp =
      locator<SpeechTranslationSerImp>();

  final HistorySer _historySer = locator<HistorySer>();

  bool _topAudioRecordStatus = false;
  bool _bottomAudioRecordStatus = false;

  WordTranslating _bottomWordTranslating = WordTranslating("", "", "", false);

  WordTranslating get getBottomWordTranslating => _bottomWordTranslating;

  bool get getBottomAudioRecordStatus => _bottomAudioRecordStatus;
  bool get getTopAudioRecordStatus => _topAudioRecordStatus;

  void setBottomWordTranslating(WordTranslating wordTranslating) {
    _bottomWordTranslating = wordTranslating;

    notifyListeners();
  }

  SpeechViewModel() {
    _audioRecorderServiceImp.init();
    notifyListeners();
  }

  toggletTopRecord() {
    _topAudioRecordStatus = !_topAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();
    notifyListeners();
  }

  toggleBottomRecord(fromLanguage, toLanguage) async {
    _bottomAudioRecordStatus = !_bottomAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();

    if (!_bottomAudioRecordStatus) {
      setBottomWordTranslating(await _translate(fromLanguage, toLanguage));
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
}
