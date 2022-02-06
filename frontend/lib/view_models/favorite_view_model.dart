import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteViewModel extends ChangeNotifier {
  late SharedPreferences _localStorage;

  List<HistoryWord> _favorites = [];

  final String _key = 'history';

  FavoriteViewModel() {
    init();
  }

  List<HistoryWord> get getFavorites => _favorites;

  void setFavorites(List<HistoryWord> favorites) {
    _favorites = favorites;
    notifyListeners();
  }

  void init() async {
    _localStorage = await SharedPreferences.getInstance();

    final List<String>? temp = _localStorage.getStringList(_key);

    if (temp == null) {
      await _localStorage.setStringList(_key, []);
      setFavorites([]);
    } else {
      setFavorites(temp
          .map(
            (e) => HistoryWord(jsonDecode(e)['originalWord'],
                jsonDecode(e)['translationWord']),
          )
          .where((element) => element.isFavorite != null)
          .toList());
    }
  }

  void addFavorite(index) async {
    _localStorage = await SharedPreferences.getInstance();

    final rawTempLocalFavorites = _localStorage.getStringList(_key);

    if (rawTempLocalFavorites != null) {
      final fixTempLocalFavorites = rawTempLocalFavorites
          .map((e) => HistoryWord(
              jsonDecode(e)['originalWord'], jsonDecode(e)['translationWord']))
          .toList();

      fixTempLocalFavorites[index].setFavoriteWord(true);

      fixTempLocalFavorites.map(
        (e) => jsonEncode(
          {
            'originalWord': e.getOriginalWord,
            'translationWord': e.getTranslationWord,
            'isFavorite': e.isFavorite
          },
        ),
      );
    }

    notifyListeners();
  }
}
