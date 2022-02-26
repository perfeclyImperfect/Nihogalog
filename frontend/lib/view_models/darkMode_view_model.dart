import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/services/darkModeSer.dart';

class DarkModeViewModel extends ChangeNotifier {
  final darkModeService = locator<DarkModeSer>();

  bool? _darkmode;
  ThemeMode? _themeMode;

  ThemeMode? get getThemeMode => _themeMode;

  DarkModeViewModel() {
    init();
  }

  void init() async {
    _darkmode = await darkModeService.getDarkMode();
    _themeMode = await darkModeService.getMode();

    notifyListeners();
  }

  toggle(bool value) async {
    _darkmode = await darkModeService.toggle();

    _themeMode = await darkModeService.getMode();

    notifyListeners();
  }

  getStatus() {
    return _darkmode;
  }

  isEmpty() async {
    return await darkModeService.getDarkMode();
  }
}
