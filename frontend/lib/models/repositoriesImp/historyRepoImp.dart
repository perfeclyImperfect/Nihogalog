import 'dart:convert';

import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/repositories/historyRepo.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';

class HistoryRepoImp extends HistoryRepo {
  SharedPreferencesRepo sharedPreferencesRepo;

  final String _key = 'history';

  HistoryRepoImp(this.sharedPreferencesRepo);

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
              'pronounciation': json['pronounciation'],
              'fromLanguage': json['fromLanguage'],
              'toLanguage': json['toLanguage'],
              'favorite': json['favorite']
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

      await setHistoryWords(tempHistoryWords);
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

    await setHistoryWords(tempHistoryWords);
  }

  @override
  Future<bool> contains(HistoryWord historyWord) async {
    var tempHistoryWords = await getHistoryWords ?? [];

    for (var i = 0; i < tempHistoryWords.length; i++) {
      if (tempHistoryWords[i].compare(historyWord)) {
        return true;
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

      await setHistoryWords(tempHistoryWords);
    }
  }
}
