import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:frontend/view_models/camera_view_model.dart';
import 'package:frontend/views/components/translationHeader/translationHeader.dart';
import 'package:frontend/views/screens/camera/camera.dart';
import 'package:provider/provider.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 15),
          child: TranslationHeader(
            additionalFunction: () {},
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tap this ',
                    ),
                    Ink(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80.0)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            HexColor('#F0B831'),
                            HexColor('#962F4A'),
                            HexColor('#1E307C'),
                          ],
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: IconTheme(
                          data: IconThemeData(
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      ' to open camera. ',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Tap the '),
                  Ink(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(80.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          HexColor('#F0B831'),
                          HexColor('#962F4A'),
                          HexColor('#1E307C'),
                        ],
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: IconTheme(
                        data: IconThemeData(
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.image,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  const Text(' to take an image from gallery.')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
