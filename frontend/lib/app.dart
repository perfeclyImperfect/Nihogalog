import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/config/environment.dart';

import 'views/screens/main.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  await environmentSetup();
  getItSetup();
  runApp(const MyApp());
}
