import 'package:frontend/models/historyWord.dart';

abstract class HistoryRep {
  Future<void> setHistoryWords(List<HistoryWord> historyWords);
  Future<List<HistoryWord>?> get getHistoryWords => getPrivateHistoryWords();

  HistoryRep() {
    init();
  }

  init();

  Future<List<HistoryWord>?> getPrivateHistoryWords();
  Future<void> addHistoryWord(HistoryWord historyWord);
  Future<bool> contains(HistoryWord historyWord);
  Future<void> delete(HistoryWord historyWord);
}
