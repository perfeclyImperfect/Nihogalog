import 'package:flutter/material.dart';
import 'package:frontend/view_models/camera_view_model.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:frontend/views/components/appbar/homeAppBar.dart';
import 'package:frontend/views/components/camera/cameraWidget.dart';
import 'package:frontend/views/components/logo/Logo.dart';
import 'package:frontend/views/components/translationHeader/translationHeader.dart';
import 'package:frontend/views/screens/camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../components/drawer/drawer.dart';
import '../../components/bottomNavigationBar/bottomNavyBar.dart';
import 'package:frontend/views/components/bottomNavigationBar/parts/bottomNavyItem.dart';
import '../../../utils/hexColor.dart';

import 'types/text.dart' as text;
import 'types/speech.dart';
import 'types/camera.dart';

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _types = [
    const text.CustomText(),
    const Speech(),
    const Camera()
  ];

  @override
  Widget build(BuildContext context) {
    final CameraViewModel cameraViewModel =
        Provider.of<CameraViewModel>(context);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: _types.elementAt(_selectedIndex),
      drawer: const DrawerScreen(),
      bottomNavigationBar: CustomAnimatedBottomBar(
        containerHeight: 125,
        selectedIndex: _selectedIndex,
        showElevation: true,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(
              Icons.text_fields,
              size: 30,
            ),
            title: Text(
              'Text',
              style: GoogleFonts.openSans(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            textAlign: TextAlign.center,
            active: true,
            topRightFunction: () => Navigator.pushNamed(context, '/home/text',
                arguments: Provider.of<WordTranslatingViewModel>(context,
                        listen: false)
                    .getText
                    .word),
          ),
          BottomNavyBarItem(
            icon: const Icon(
              Icons.mic_outlined,
              size: 30,
            ),
            title: Text(
              'Speech',
              style: GoogleFonts.openSans(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            textAlign: TextAlign.center,
            topRightFunction: () => Navigator.pushNamed(context, "/speech"),
          ),
          BottomNavyBarItem(
            icon: const Icon(
              Icons.camera_alt,
              size: 30,
            ),
            title: Text(
              'Camera',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            textAlign: TextAlign.center,
            topRightFunction: () {
              cameraViewModel.pickImage(ImageSource.gallery);
            },
            customIcon: const Icon(Icons.image),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreen();
}
