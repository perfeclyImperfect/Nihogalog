import 'package:flutter/material.dart';
import 'package:frontend/views/screens/camera/camera.dart';
import 'package:frontend/views/screens/speech/speech.dart';

import '../views/screens/home/home.dart';
import '../views/screens/history.dart';
import '../views/screens/favorite.dart';
import '../views/screens/text/text.dart';

getNamedRoutes() {
  return {
    HomeScreen.route: (context) => const HomeScreen(),
    HistoryScreen.route: (context) => const HistoryScreen(),
    FavoriteScreen.route: (context) => const FavoriteScreen(),
<<<<<<< HEAD
    SpeechScreen.route: (context) => SpeechScreen(),
    CameraScreen.route: (context) => const CameraScreen()
=======
    SpeechScreen.route: (context) => const SpeechScreen(),
>>>>>>> c74959c71f6064353b9979463459a6d11139e234
  };
}

getOnGenerateRoute(settings) {
  if (settings.name == TextScreen.route) {
    final String args = settings.arguments;

    return MaterialPageRoute(builder: (context) {
      return TextScreen(initialData: args);
    });
  }

  return null;
}
