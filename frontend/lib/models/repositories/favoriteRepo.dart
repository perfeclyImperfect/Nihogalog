import 'package:frontend/models/historyWord.dart';

abstract class FavoriteRepo {
  Future<List<HistoryWord>?> get getFavorites => getPrivateFavoriteWords();

  FavoriteRepo() {
    init();
  }

  init();

  Future<List<HistoryWord>?> getPrivateFavoriteWords();
  Future<void> addFavorite(HistoryWord historyWord);
  Future<bool> contains(HistoryWord historyWord);
  Future<List<HistoryWord>> delete(HistoryWord historyWord);
}
