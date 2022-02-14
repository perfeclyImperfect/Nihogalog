import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/services/favoriteSer.dart';

class FavoriteViewModel extends ChangeNotifier {
  final FavoriteSer favoriteSer = locator<FavoriteSer>();

  List<HistoryWord> _favorites = [];

  FavoriteViewModel() {
    init();
  }

  List<HistoryWord> get getFavorites => _favorites;

  void init() async {
    _favorites = await favoriteSer.getFavorites() ?? [];

    notifyListeners();
  }

  void toggleFavorite(HistoryWord historyWord) async {
    _favorites = await favoriteSer.toggleFavorite(historyWord) ?? [];

    notifyListeners();
  }

  void remove(HistoryWord historyWord) async {
    _favorites = await favoriteSer.delete(historyWord);

    notifyListeners();
  }
}
