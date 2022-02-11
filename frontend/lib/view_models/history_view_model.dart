import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:frontend/models/services/historySer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryViewModel extends ChangeNotifier {
  HistorySer historySer = locator<HistorySer>();

  List<HistoryWord> _history = [];
  final List<int> _selected = [];
  bool _edit = false;

  List<HistoryWord> get getHistory => _history;
  bool get getEditStatus => _edit;
  List<int> get getSelected => _selected;

  void setHistory(List<HistoryWord> history) {
    historySer.setHistoryWords(history);
    _history = history;

    notifyListeners();
  }

  HistoryViewModel() {
    init();
  }

  void init() async {
    // final yup = await SharedPreferences.getInstance();
    // yup.clear();

    List<HistoryWord>? temp = await historySer.getHistoryWords() ?? [];

    setHistory(temp);
  }

  void selectToggle(int index) {
    _selected.contains(index) ? _selected.remove(index) : _selected.add(index);

    notifyListeners();
  }

  toggleEdit() {
    _edit = !_edit;

    if (_edit == false) {
      _selected.clear();
    }

    notifyListeners();
  }

  void add(HistoryWord historyWord) async {
    _history = await historySer.addHistoryWord(historyWord) ?? [historyWord];

    notifyListeners();
  }

  void delete() async {
    final List<HistoryWord> temp = [];
    for (int i = 0; i < _selected.length; i++) {
      temp.add(_history[_selected[i]]);
    }

    _history = await historySer.deleteMultiple(temp);
    _selected.clear();

    notifyListeners();
  }

  void reset() async {
    _history = await historySer.reset() ?? [];

    notifyListeners();
  }
}
