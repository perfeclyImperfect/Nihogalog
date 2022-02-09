import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryViewModel extends ChangeNotifier {
  HistorySer historySer = locator<HistorySer>();

  List<HistoryWord> _history = [];

  List<HistoryWord> get getHistory => _history;

  void setHistory(List<HistoryWord> history) {
    historySer.setHistoryWords(history);
    _history = history;

    notifyListeners();
  }

  HistoryViewModel() {
    init();
  }

  void init() async {
    List<HistoryWord>? temp = await historySer.getHistoryWords() ?? [];

    setHistory(temp);
  }

  void add(HistoryWord historyWord) async {
    _history = await historySer.addHistoryWord(historyWord) ?? [historyWord];

    notifyListeners();
  }

  void reset() async {
    _history = await historySer.reset() ?? [];

    notifyListeners();
  }
}
