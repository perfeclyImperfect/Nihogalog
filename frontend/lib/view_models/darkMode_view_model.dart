import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/services/darkModeSer.dart';

class DarkModeViewModel extends ChangeNotifier {
  final darkModeService = locator<DarkModeSer>();

  bool _darkmode = false;

  DarkModeViewModel() {
    init();
  }

  void init() async {
    _darkmode = await darkModeService.getDarkMode();

    notifyListeners();
  }

  toggle(bool value) async {
    _darkmode = await darkModeService.toggle();

    notifyListeners();
  }

  getStatus() {
    return _darkmode;
  }

  isEmpty() async {
    return await darkModeService.getDarkMode();
  }
}
