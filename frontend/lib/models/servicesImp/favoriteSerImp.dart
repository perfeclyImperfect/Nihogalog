import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/favoriteRepo.dart';
import 'package:frontend/models/services/favoriteSer.dart';

class FavoriteSerImp extends FavoriteSer {
  final FavoriteRepo _favoriteRepo;

  FavoriteSerImp(this._favoriteRepo);

  @override
  Future<List<HistoryWord>?> toggleFavorite(HistoryWord historyWord) async {
    if (await _favoriteRepo.contains(historyWord)) {
      await _favoriteRepo.delete(historyWord);
    } else {
      await _favoriteRepo.addFavorite(historyWord);
    }

    return await _favoriteRepo.getFavorites;
  }

  @override
  Future<bool> contains(HistoryWord historyWord) async {
    return true;
  }

  @override
  Future<List<HistoryWord>> delete(HistoryWord historyWord) async {
    return await _favoriteRepo.delete(historyWord);
  }

  @override
  Future<List<HistoryWord>?> getFavorites() async {
    return await _favoriteRepo.getFavorites;
  }
}
