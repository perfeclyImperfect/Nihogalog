import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:frontend/views/components/camera/cameraWidget.dart';
import 'package:frontend/views/components/translationHeader/translationHeader.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key, required this.image}) : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Stack(
            children: [
              CameraWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: TranslationHeader(additionalFunction: () {}),
                ),
              ),
            ],
          )
        : Center(
            child: Image.file(image!),
          );
  }
}
