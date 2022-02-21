import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

const String pathToSaveAudio = "/foo.wav";

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
    String tempFullPath = "${tempDir.path}$pathToSaveAudio";

    if (!_isRecorderInitialized) {
      return;
    }

    print('recording');
    await _audioRecorder?.startRecorder(
      toFile: tempFullPath,
      codec: Codec.pcm16WAV,
    );
  }

  Future _stop() async {
    if (!_isRecorderInitialized) {
      return;
    }

    print('stop recording');
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
