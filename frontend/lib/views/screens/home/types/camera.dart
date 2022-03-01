import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/components/camera/camera_screen.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    WidgetsFlutterBinding.ensureInitialized();

    return Container();
=======
    return Container(
      child: CameraScreen(),
    );
>>>>>>> c74959c71f6064353b9979463459a6d11139e234
  }
}
