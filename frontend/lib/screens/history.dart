import 'package:flutter/material.dart';

import '../components/drawer/drawer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static String route = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerScreen(),
      body: Text('sad'),
    );
  }
}
