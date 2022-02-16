import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/historyRepo.dart';
import 'package:frontend/models/services/historySer.dart';

class HistorySerImp extends HistorySer {
  final HistoryRepo historyRep;

  HistorySerImp(this.historyRep);

  @override
  Future<List<HistoryWord>?> getHistoryWords() async {
    return await historyRep.getHistoryWords ?? [];
  }

  @override
  Future<void> setHistoryWords(List<HistoryWord> historyWords) async {
    await historyRep.setHistoryWords(historyWords);
  }

  @override
  Future<List<HistoryWord>?> addHistoryWord(HistoryWord historyWord) async {
    HistoryWord? tempHistoryWord = await historyRep.get(historyWord);

    final bool condition = tempHistoryWord != null;
    if (condition) {
      await historyRep.delete(historyWord);
    }

    await historyRep.addHistoryWord(condition ? tempHistoryWord : historyWord);

    return await historyRep.getHistoryWords;
  }

  @override
  Future<List<HistoryWord>?> reset() async {
    await setHistoryWords([]);

    return [];
  }

  @override
  Future<bool> contains(HistoryWord historyWord) async {
    return await historyRep.contains(historyWord);
  }

  @override
  void delete(HistoryWord historyWord) async {
    await historyRep.delete(historyWord);
  }

  @override
  Future<List<HistoryWord>> deleteMultiple(
      List<HistoryWord> historyWords) async {
    final temp = await historyRep.getHistoryWords ?? [];

    for (int i = 0; i < historyWords.length; i++) {
      for (int j = 0; j < temp.length; j++) {
        if (historyWords[i].compare(temp[j])) {
          temp.removeAt(j);
        }
      }
    }

    await setHistoryWords(temp);

    return temp;
  }

  @override
  Future<List<HistoryWord>> toggleFavorite(HistoryWord historyWord) async {
    final temp = await historyRep.getHistoryWords ?? [];

    for (int i = 0; i < temp.length; i++) {
      final HistoryWord value = temp[i];
      if (value.compare(historyWord)) {
        final bool? tempFavorite = value.getFavorite;

        temp[i].setFavoriteWord(tempFavorite != null ? !tempFavorite : true);
      }
    }

    await setHistoryWords(temp);

    return temp;
  }

  @override
  Future<HistoryWord?> get(HistoryWord historyWord) async {
    return await historyRep.get(historyWord);
  }

  @override
  Future<List<HistoryWord>> removeFavorites(List<HistoryWord> favorites) async {
    final List<HistoryWord> tempHistoryWords =
        await historyRep.getHistoryWords ?? [];

    for (int i = 0; i < tempHistoryWords.length; i++) {
      for (int j = 0; j < favorites.length; j++) {
        if (tempHistoryWords[i].compare(favorites[j])) {
          tempHistoryWords[i].setFavoriteWord(false);
          break;
        }
      }
    }

    await historyRep.setHistoryWords(tempHistoryWords);

    return tempHistoryWords;
  }
}
