import 'package:frontend/models/historyWord.dart';

abstract class HistorySer {
  Future<List<HistoryWord>?> getHistoryWords();
  void setHistoryWords(List<HistoryWord> historyWords);
  Future<List<HistoryWord>?> addHistoryWord(HistoryWord historyWord);

  Future<List<HistoryWord>?> reset();
  Future<bool> contains(HistoryWord historyWord);
  void delete(HistoryWord historyWord);
  Future<List<HistoryWord>> deleteMultiple(List<HistoryWord> historyWords);
}
