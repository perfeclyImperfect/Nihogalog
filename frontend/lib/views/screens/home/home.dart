import 'package:flutter/material.dart';
import 'package:frontend/views/components/camera/camera_screen.dart';
import 'package:frontend/views/components/logo/Logo.dart';
import 'package:frontend/views/screens/camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/drawer/drawer.dart';
import '../../components/bottomNavigationBar/bottomNavyBar.dart';
import 'package:frontend/views/components/bottomNavigationBar/parts/bottomNavyItem.dart';
import '../../../utils/hexColor.dart';

import 'types/text.dart' as text;
import 'types/speech.dart';
import 'types/camera.dart';

class _HomeScreen extends State<HomeScreen> {
  final List<Widget> _types = [
    const text.CustomText(),
    const Speech(),
    CameraScreen(),
  ];

  int _selectedIndex = 0;

  void _changeItem(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
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
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: const Logo(
          padding: EdgeInsets.only(left: 30),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.white,
        ),
      ),
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
            active: false,
            topRightFunction: () => Navigator.pushNamed(context, "/home"),
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
            topRightFunction: () => Navigator.pushNamed(context, ""),
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
