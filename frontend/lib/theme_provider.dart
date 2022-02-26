import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('#373c42'),
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
