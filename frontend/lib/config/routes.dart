import 'package:flutter/material.dart';

import '../views/screens/home/home.dart';
import '../views/screens/history/history.dart';
import '../views/screens/favorite/favorite.dart';
import '../views/screens/text/text.dart';

getNamedRoutes() {
  return {
    HomeScreen.route: (context) => const HomeScreen(),
    HistoryScreen.route: (context) => const HistoryScreen(),
    FavoriteScreen.route: (context) => const FavoriteScreen(),
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
