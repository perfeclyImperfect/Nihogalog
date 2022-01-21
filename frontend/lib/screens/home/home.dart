import 'package:flutter/material.dart';

import '../../components/drawer/drawer.dart';
import '../../utility/hexColor.dart';

import 'types/text.dart' as text;
import 'types/speech.dart';
import 'types/camera.dart';

class _HomeScreen extends State<HomeScreen> {
  static final List<Widget> _types = [
    const text.CustomText(),
    const Speech(),
    const Camera(),
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
          title: const Text('nihogalog'),
          centerTitle: true,
        ),
        body: _types.elementAt(_selectedIndex),
        drawer: const DrawerScreen(),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
                blurStyle: BlurStyle.outer,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          constraints: const BoxConstraints(
            minHeight: 100,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: BottomNavigationBar(
                elevation: 0,
                iconSize: 30,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.text_fields),
                    label: 'Text',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.mic_outlined),
                    label: 'Mic',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_camera),
                    label: 'Camera',
                  ),
                ],
                onTap: _changeItem,
                currentIndex: _selectedIndex,
              ),
            ),
          ),
        )

        // bottomNavigationBar: Container(
        //   decoration: const BoxDecoration(
        //       color: Colors.green,
        //       borderRadius: BorderRadius.horizontal(
        //           left: Radius.circular(50), right: Radius.circular(50))),
        //   child:
        //   BottomNavigationBar(
        //     landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.text_fields),
        //         label: 'Text',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.mic_outlined),
        //         label: 'Mic',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.camera_alt),
        //         label: 'Camera',
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreen();
}
