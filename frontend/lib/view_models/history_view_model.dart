import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/services/historySer.dart';

class HistoryViewModel extends ChangeNotifier {
  HistorySer historySer = locator<HistorySer>();

  List<HistoryWord> _history = [];
  List<int> _selected = [];

  List<int> get getSelected => _selected;

  bool _edit = false;
  bool get getEditStatus => _edit;

  List<HistoryWord> get getHistory => _history;

  List<HistoryWord> getFavorites() {
    return _history.where((element) => element.getFavorite ?? false).toList();
  }

  void deleteFavorites() async {
    final List<HistoryWord> temp = [];
    for (int i = 0; i < _selected.length; i++) {
      temp.add(getFavorites()[_selected[i]]);
    }

    _history = await historySer.removeFavorites(temp);
    _selected = [];

    notifyListeners();
  }

  void selectAllFavorites() {
    if (getSelected.isNotEmpty) {
      _selected = [];
    } else {
      final List<HistoryWord> tempFavorites = getFavorites();
      final List<int> temp = [];

      for (int i = 0; i < tempFavorites.length; i++) {
        if (tempFavorites[i].getFavorite ?? false) {
          temp.add(i);
        }
      }

      _selected = temp;
    }

    notifyListeners();
  }

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

  void toggleSelect(int index) {
    _selected.contains(index) ? _selected.remove(index) : _selected.add(index);

    notifyListeners();
  }

  void toggleEdit() {
    _edit = !_edit;

    if (_edit == false) {
      _selected.clear();
    }

    notifyListeners();
  }

  void toggleFavorite(HistoryWord historyWord) async {
    _history = await historySer.toggleFavorite(historyWord);

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

  void selectAll() {
    _selected = _selected.isNotEmpty
        ? []
        : [for (int i = 0; i < _history.length; i++) i];

    notifyListeners();
  }
}
