import 'package:flutter/material.dart';

import 'screens/home/home.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final _title = 'Nigohalog';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: HomeScreen.route,
      routes: getRoutes(),
    );
  }
}
