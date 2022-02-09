import 'dart:convert';

import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/historyRep.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';

class HistoryRepImp extends HistoryRep {
  SharedPreferencesRepo sharedPreferencesRepo;

  final String _key = 'history';

  HistoryRepImp(this.sharedPreferencesRepo);

  @override
  Future<List<HistoryWord>?> getPrivateHistoryWords() async {
    List<String>? tempHistory = await sharedPreferencesRepo.getStringList(_key);

    if (tempHistory != null) {
      List<HistoryWord> listHistoryWord = tempHistory.map(
        (e) {
          final json = jsonDecode(e);

          return HistoryWord.fromJson(
            {
              'originalWord': json['originalWord'],
              'translationWord': json['translationWord'],
              'fromLanguage': json['fromLanguage'],
              'toLanguage': json['toLanguage']
            },
          );
        },
      ).toList();

      return listHistoryWord;
    }

    return null;
  }

  @override
  init() async {
    List<String>? tempStringHistoryWords =
        await sharedPreferencesRepo.getStringList(_key);

    List<HistoryWord> tempHistoryWords;

    if (tempStringHistoryWords == null) {
      tempHistoryWords = [];

      setHistoryWords(tempHistoryWords);
    }
  }

  @override
  Future<void> setHistoryWords(List<HistoryWord> historyWords) async {
    List<String> tempHistory =
        historyWords.map((e) => jsonEncode(e.toJson())).toList();

    sharedPreferencesRepo.setStringList(_key, tempHistory);
  }

  @override
  addHistoryWord(HistoryWord historyWord) async {
    List<HistoryWord>? tempHistoryWords = await getPrivateHistoryWords() ?? [];

    tempHistoryWords.add(historyWord);

    setHistoryWords(tempHistoryWords);
  }

  @override
  Future<bool> contains(HistoryWord historyWord) async {
    var tempHistoryWords = await getHistoryWords;

    if (tempHistoryWords != null) {
      for (var i = 0; i < tempHistoryWords.length; i++) {
        if (tempHistoryWords[i].compare(historyWord)) {
          return true;
        }
      }
    }

    return false;
  }

  @override
  Future<void> delete(HistoryWord historyWord) async {
    final List<HistoryWord>? tempHistoryWords = await getHistoryWords;

    if (tempHistoryWords != null) {
      for (var i = 0; i < tempHistoryWords.length; i++) {
        if (tempHistoryWords[i].compare(historyWord)) {
          tempHistoryWords.removeAt(i);
        }
      }

      tempHistoryWords.forEach((element) {
        print(element.toJson());
      });

      setHistoryWords(tempHistoryWords);

      final sheesh = await getHistoryWords;

      print('source deleted');

      sheesh?.forEach((element) {
        print(element.toJson());
      });
    }
  }
}
