import 'package:flutter/cupertino.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/servicesImp/audioRecorderSerImp.dart';

class SpeechViewModel extends ChangeNotifier {
  final AudioRecorderServiceImp _audioRecorderServiceImp =
      locator<AudioRecorderServiceImp>();

  bool topAudioRecordStatus = false;
  bool bottomAudioRecordStatus = false;

  SpeechViewModel() {
    _audioRecorderServiceImp.init();
    notifyListeners();
  }

  toggletTopRecord() {
    topAudioRecordStatus = !topAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();
    notifyListeners();
  }

  toggleBottomRecord() {
    bottomAudioRecordStatus = !bottomAudioRecordStatus;

    _audioRecorderServiceImp.toggleRecording();

    notifyListeners();
  }
}
