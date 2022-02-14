import 'package:frontend/models/historyWord.dart';

abstract class FavoriteSer {
  Future<List<HistoryWord>?> getFavorites();
  Future<List<HistoryWord>?> toggleFavorite(HistoryWord historyWord);

  Future<bool> contains(HistoryWord historyWord);
  Future<List<HistoryWord>> delete(HistoryWord historyWord);
}
