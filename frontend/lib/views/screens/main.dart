import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config/theme_provider.dart';
import 'package:frontend/view_models/darkMode_view_model.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

import '../../config/routes.dart';
import '../../config/providers.dart';

import '../../utils/constants.dart';

List<CameraDescription> cameras = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => DarkModeViewModel(),
        builder: (context, _) {
          final darkModeViewModel = Provider.of<DarkModeViewModel>(context);

          return MultiProvider(
            providers: getProviders(),
            child: MaterialApp(
              supportedLocales: supportedLocales,
              themeMode: darkModeViewModel.getThemeMode,
              darkTheme: MyThemes.darkTheme,
              theme: MyThemes.lightTheme,
              title: kMaterialAppTitle,
              initialRoute: HomeScreen.route,
              routes: getNamedRoutes(),
              onGenerateRoute: (settings) => getOnGenerateRoute(settings),
            ),
          );
        },
      );
}
