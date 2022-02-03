import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeViewModel extends ChangeNotifier {
  late SharedPreferences _localStorage;

  final _key = 'darkmode';

  toggle(bool value) async {
    _localStorage = await SharedPreferences.getInstance();

    await _localStorage.setBool(_key, value);

    notifyListeners();
  }

  getStatus() async {
    _localStorage = await SharedPreferences.getInstance();

    return _localStorage.getBool(_key);
  }

  isEmpty() async {
    _localStorage = await SharedPreferences.getInstance();

    return !_localStorage.containsKey(_key);
  }
}
