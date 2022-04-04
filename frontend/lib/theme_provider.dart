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
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.white, textStyle: const TextStyle(fontSize: 17)),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 15),
      bodyText2: TextStyle(fontSize: 15),
    ).apply(
      bodyColor: Colors.black,
      fontFamily: 'OpenSans',
      fontSizeFactor: 1.0,
      fontSizeDelta: 2.0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.black, textStyle: const TextStyle(fontSize: 17)),
    ),
  );
}
