import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/favoriteRepo.dart';
import 'package:frontend/models/repositories/historyRepo.dart';

class FavoriteRepoImp extends FavoriteRepo {
  final HistoryRepo historyRepo;

  FavoriteRepoImp(this.historyRepo);

  @override
  init() {}

  @override
  Future<void> addFavorite(HistoryWord historyWord) async {
    List<HistoryWord>? tempHistoryWords = await getPrivateFavoriteWords() ?? [];

    for (int i = 0; i < tempHistoryWords.length; i++) {
      if (tempHistoryWords[i].compare(historyWord)) {
        tempHistoryWords[i].setFavoriteWord(true);
        break;
      }
    }

    await historyRepo.setHistoryWords(tempHistoryWords);
  }

  @override
  Future<bool> contains(HistoryWord historyWord) async {
    List<HistoryWord>? tempHistoryWords = await getPrivateFavoriteWords() ?? [];

    bool temp =
        tempHistoryWords[await _getIndex(historyWord)].getFavorite ?? false;

    return temp;
  }

  @override
  Future<List<HistoryWord>> delete(HistoryWord historyWord) async {
    List<HistoryWord> tempHistoryWords = await getPrivateFavoriteWords() ?? [];

    tempHistoryWords.removeAt(await _getIndex(historyWord));

    await historyRepo.setHistoryWords(tempHistoryWords);

    return tempHistoryWords;
  }

  @override
  Future<List<HistoryWord>?> getPrivateFavoriteWords() async {
    List<HistoryWord> tempFavorite = await historyRepo.getHistoryWords ?? [];
    tempFavorite.map((e) => e.getFavorite).toList();

    return tempFavorite;
  }

  Future<int> _getIndex(HistoryWord historyWord) async {
    List<HistoryWord>? tempHistoryWords = await getPrivateFavoriteWords() ?? [];

    for (int i = 0; i < tempHistoryWords.length; i++) {
      if (tempHistoryWords[i].compare(historyWord)) {
        return i;
      }
    }

    return -1;
  }
}
