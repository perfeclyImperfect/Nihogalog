import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/components/camera/cameraWidget.dart';

class CameraScreen extends StatelessWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({this.cameras, Key? key}) : super(key: key);

  static String route = '/camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraWidget(
        cameras: cameras,
      ),
    );
  }
}
