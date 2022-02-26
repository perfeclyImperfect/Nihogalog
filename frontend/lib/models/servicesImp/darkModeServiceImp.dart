import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:frontend/models/repositories/darkModeRepo.dart';
import 'package:frontend/models/services/darkModeSer.dart';
import 'package:frontend/theme_provider.dart';

class DarkModeSerImp extends DarkModeSer {
  DarkModeRepo darkModeRepo;

  DarkModeSerImp(this.darkModeRepo);

  @override
  Future<bool> getDarkMode() async {
    return await darkModeRepo.getDarkMode ?? false;
  }

  @override
  Future<bool> toggle() async {
    bool? temp = await darkModeRepo.getDarkMode;

    if (temp == null) {
      temp = false;
    } else {
      temp = !temp;
    }

    darkModeRepo.setDarkMode(temp);

    return temp;
  }

  @override
  Future<ThemeMode> getMode() async {
    return await getDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }
}
