import 'package:flutter/material.dart';

import 'package:frontend/views/components/drawer/drawer.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  static String route = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: const DrawerScreen(),
      body: Text('sad'),
    );
  }
}
