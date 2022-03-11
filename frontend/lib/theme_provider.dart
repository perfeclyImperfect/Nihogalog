import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('#373c42'),
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 15),
      bodyText2: TextStyle(fontSize: 15),
      button: TextStyle(fontSize: 15),
    ).apply(
      bodyColor: Colors.white,
      fontFamily: 'OpenSans',
      fontSizeFactor: 1.1,
      fontSizeDelta: 2.0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 15),
      bodyText2: TextStyle(fontSize: 15),
      button: TextStyle(fontSize: 15, color: Colors.green),
    ).apply(
      bodyColor: Colors.black,
      fontFamily: 'OpenSans',
      fontSizeFactor: 1.0,
      fontSizeDelta: 2.0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(),
  );
}
