import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:frontend/view_models/camera_view_model.dart';
import 'package:provider/provider.dart';

class CameraWidget extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraWidget({this.cameras, Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});
    });
  }

  Future openDescription(title, description) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [TextButton(onPressed: close, child: const Text("Close"))],
        ),
      );

  void close() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CameraViewModel cameraViewModel = Provider.of<CameraViewModel>(context);

    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 65,
                width: double.infinity,
                child: CameraPreview(controller),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: IconButton(
                    tooltip: "test",
                    iconSize: 55,
                    onPressed: () {},
                    icon: const Icon(Icons.camera),
                  ),
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () => cameraViewModel.setSelectedMode(0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              HexColor('#F0B831'),
                              HexColor('#962F4A'),
                              HexColor('#1E307C'),
                            ],
                          )),
                      child: Icon(
                        Icons.data_object,
                        size: 35,
                        color: cameraViewModel.getSelectedIndex == 0
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    heroTag: "btn1",
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () => cameraViewModel.setSelectedMode(1),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              HexColor('#F0B831'),
                              HexColor('#962F4A'),
                              HexColor('#1E307C'),
                            ],
                          )),
                      child: Icon(
                        Icons.warning,
                        size: 35,
                        color: cameraViewModel.getSelectedIndex == 1
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    heroTag: "btn2",
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () => cameraViewModel.setSelectedMode(2),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              HexColor('#F0B831'),
                              HexColor('#962F4A'),
                              HexColor('#1E307C'),
                            ],
                          )),
                      child: Icon(
                        Icons.text_fields,
                        size: 35,
                        color: cameraViewModel.getSelectedIndex == 2
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    heroTag: "btn3",
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () => openDescription(
                    cameraViewModel.getInformationTitle,
                    cameraViewModel.getInformation),
                splashRadius: 15,
              ),
            ),
          ],
        ),

        //Android/iOS
        // Image.file(File(pictureFile!.path)))
      ],
    );
  }
}
