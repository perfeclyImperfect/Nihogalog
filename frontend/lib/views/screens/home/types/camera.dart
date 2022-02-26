import 'package:flutter/material.dart';
import 'package:frontend/views/components/camera/camera.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: CameraWidget());
  }
}
