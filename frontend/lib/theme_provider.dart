import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('#373c42'),
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 16,
      ),
    ).apply(
      bodyColor: Colors.black,
      fontFamily: 'OpenSans',
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(),
    ),
  );
}
