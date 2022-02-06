import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryViewModel extends ChangeNotifier {
  late SharedPreferences _localStorage;

  List<HistoryWord> _history = [];

  final String _key = 'history';

  List<HistoryWord> get getHistory => _history;

  void setHistory(List<HistoryWord> history) {
    _history = history;
    notifyListeners();
  }

  HistoryViewModel() {
    init();
  }

  void init() async {
    _localStorage = await SharedPreferences.getInstance();

    final List<String>? temp = _localStorage.getStringList(_key);

    if (temp == null) {
      await _localStorage.setStringList(_key, []);
      setHistory([]);
    } else {
      setHistory(temp
          .map((e) => HistoryWord(
              jsonDecode(e)['originalWord'], jsonDecode(e)['translationWord']))
          .toList());
    }
  }

  void set(List<HistoryWord> history) {
    _history = history;

    notifyListeners();
  }

  void add(HistoryWord historyWord) async {
    _localStorage = await SharedPreferences.getInstance();

    final tempLocalHistory = _localStorage.getStringList(_key);

    if (tempLocalHistory != null) {
      _history.add(historyWord);

      tempLocalHistory.add(
        jsonEncode(
          {
            'originalWord': historyWord.getOriginalWord,
            'translationWord': historyWord.getTranslationWord
          },
        ),
      );

      await _localStorage.setStringList(_key, tempLocalHistory);
    }

    notifyListeners();
  }

  void reset() async {
    _localStorage = await SharedPreferences.getInstance();

    _localStorage.setStringList(_key, []);
    setHistory([]);
  }
}
