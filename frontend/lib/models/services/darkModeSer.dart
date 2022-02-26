import 'package:flutter/material.dart';

abstract class DarkModeSer {
  Future<bool> getDarkMode();
  Future<bool> toggle();
  Future<ThemeMode> getMode();
}
