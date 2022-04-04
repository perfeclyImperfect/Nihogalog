import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/view_models/camera_view_model.dart';
import 'package:frontend/views/components/camera/cameraWidget.dart';
import 'package:frontend/views/components/translationHeader/translationHeader.dart';
import 'package:frontend/views/screens/camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CameraViewModel cameraViewModel =
        Provider.of<CameraViewModel>(context, listen: false);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 15),
          child: TranslationHeader(
            additionalFunction: () {},
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: cameraViewModel.getImage == null
                ? TextButton(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () async {
                      await availableCameras().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CameraScreen(
                              cameras: value,
                            ),
                          ),
                        ),
                      );
                    },
                    child: DefaultTextStyle.merge(
                      child: const Text(
                        'Tap the text to open camera.',
                      ),
                    ),
                  )
                : Image.file(cameraViewModel.getImage!),
          ),
        )
      ],
    );
  }
}
