import 'package:flutter/material.dart';
import 'package:frontend/drawer_icons_icons.dart';
import 'package:frontend/view_models/darkMode_view_model.dart';

import 'parts/darkMode.dart';
import 'parts/navigationListTile.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  changeScreen(context, routeName) {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> drawerListNames = ['home', 'history', 'favorites'];

    final List<IconData> drawerListIcons = [
      DrawerIcons.home,
      Icons.book,
      DrawerIcons.star
    ];

    final drawerListWidgets = [
      for (int i = 0; i < drawerListNames.length; i++)
        NavigationListTile(
          icon: drawerListIcons[i],
          text: drawerListNames[i][0].toUpperCase() +
              drawerListNames[i].substring(1, drawerListNames[i].length),
          onTap: (context) => changeScreen(context, '/' + drawerListNames[i]),
        )
    ];

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
        child: Column(
          children: [
            for (var i in drawerListWidgets) i,
            const ListTile(
              title: DarkMode(),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '© 2021 nihogalog',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
