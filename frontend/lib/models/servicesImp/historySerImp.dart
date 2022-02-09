import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/historyRep.dart';
import 'package:frontend/models/services/historySer.dart';

class HistorySerImp extends HistorySer {
  final HistoryRep historyRep;

  HistorySerImp(this.historyRep);

  @override
  Future<List<HistoryWord>?> getHistoryWords() async {
    return await historyRep.getHistoryWords ?? [];
  }

  @override
  Future<void> setHistoryWords(List<HistoryWord> historyWords) async {
    historyRep.setHistoryWords(historyWords);
  }

  @override
  Future<List<HistoryWord>?> addHistoryWord(HistoryWord historyWord) async {
    if (await historyRep.contains(historyWord)) {
      await historyRep.delete(historyWord);

      final temp = await historyRep.getHistoryWords;

      print("After deletion:");
      temp?.forEach((element) {
        print(element.toJson());
      });
    }

    await historyRep.addHistoryWord(historyWord);

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
}
