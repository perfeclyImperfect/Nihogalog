import 'package:flutter/cupertino.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/servicesImp/audioRecorderSerImp.dart';
import 'package:frontend/models/servicesImp/speechTranslationSerImp.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/utils/constants.dart';

class SpeechViewModel extends ChangeNotifier {
  final AudioRecorderServiceImp _audioRecorderServiceImp =
      locator<AudioRecorderServiceImp>();

  final SpeechTranslationSerImp _speechTranslationSerImp =
      locator<SpeechTranslationSerImp>();

  bool _topAudioRecordStatus = false;
  bool _bottomAudioRecordStatus = false;

  WordTranslating _bottomWordTranslating = WordTranslating("", "", "", false);

  WordTranslating get getBottomWordTranslating => _bottomWordTranslating;

  bool get getBottomAudioRecordStatus => _bottomAudioRecordStatus;
  bool get getTopAudioRecordStatus => _topAudioRecordStatus;

  SpeechViewModel() {
    _audioRecorderServiceImp.init();
    notifyListeners();
  }

  toggletTopRecord() {
    _topAudioRecordStatus = !_topAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();
    notifyListeners();
  }

  toggleBottomRecord(fromLanguage, toLanguage) {
    _bottomAudioRecordStatus = !_bottomAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();

    if (!_bottomAudioRecordStatus) {
      _translate(_bottomWordTranslating.word, fromLanguage, toLanguage);
    }

    notifyListeners();
  }

  _translate(value, fromLanguage, toLanguage) {
    final tempTranslation = _speechTranslationSerImp.translate(
        temporaryAudioFilename, fromLanguage, toLanguage);
  }
}
