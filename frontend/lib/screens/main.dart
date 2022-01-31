import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

import '../../config/routes.dart';
import '../../config/providers.dart';

import '../utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        title: kMaterialAppTitle,
        initialRoute: HomeScreen.route,
        routes: getRoutes(),
      ),
    );
  }
}
