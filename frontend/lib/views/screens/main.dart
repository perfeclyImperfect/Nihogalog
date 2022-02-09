import 'package:flutter/material.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:frontend/views/screens/text/text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/home.dart';

import '../../config/routes.dart';
import '../../config/providers.dart';

import '../../utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        title: kMaterialAppTitle,
        initialRoute: HomeScreen.route,
        routes: getNamedRoutes(),
        onGenerateRoute: (settings) => getOnGenerateRoute(settings),
      ),
    );
  }
}
