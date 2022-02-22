import 'dart:io';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:frontend/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioRecorderServiceImp {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialized = false;
  bool get isRecording => _isRecorderInitialized;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();

    final micStat = await Permission.microphone.status;

    if (!micStat.isGranted) {
      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException("Microphone permission not given");
      }
    }

    await _audioRecorder!.openAudioSession();
    _isRecorderInitialized = true;
  }

  Future _record() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempFullPath = "${tempDir.path}/$temporaryAudioFilename";

    print("FULL PATH $tempFullPath");

    if (!_isRecorderInitialized) {
      return;
    }

    await _audioRecorder?.startRecorder(
      toFile: tempFullPath,
      codec: Codec.pcm16WAV,
    );
  }

  Future _stop() async {
    if (!_isRecorderInitialized) {
      return;
    }

    await _audioRecorder?.stopRecorder();
  }

  Future toggleRecording() async {
    if (_audioRecorder!.isStopped) {
      await _record();
    } else {
      await _stop();
    }
  }

  void dispose() {
    if (_isRecorderInitialized) {
      return;
    }

    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    _isRecorderInitialized = false;
  }
}
