import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:frontend/view_models/languageTranslation_view_model.dart';
import 'package:frontend/view_models/speech_view_model.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:frontend/views/components/translationHeader/translationHeader.dart';
import 'package:provider/provider.dart';

class SpeechScreen extends StatelessWidget {
  SpeechScreen({Key? key}) : super(key: key);

  static String route = '/speech';

  final double topPad = 25.0;
  final double horizotalPad = 15.0;

  void _copyTranslationToClipBoard(context, text) {
    Clipboard.setData(ClipboardData(text: text)).then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Original text copied to clipboard"),
          ),
        );
      },
    );
  }

  void _makeFavorite(context, SpeechViewModel speechViewModel,
      LanguageTranslationViewModel languageTranslationViewModel) {
    final tempWord = speechViewModel.getCurrentWordTranslating!;
    final tempLanguage = languageTranslationViewModel.getLanguageTranslation;

    HistoryWord tempHistoryWord = HistoryWord(
        tempWord.word,
        tempWord.translation,
        tempWord.translationPronounciation,
        tempLanguage.getFromLanguage ?? 'Tagalog',
        tempLanguage.getToLanguage ?? 'Nihogalog',
        tempWord.favorite);

    speechViewModel.toggleFavorite();
    Provider.of<HistoryViewModel>(context, listen: false)
        .toggleFavorite(tempHistoryWord);
  }

  getPlayIcon(condition) {
    return !condition ? Icons.mic : Icons.stop;
  }

  @override
  Widget build(BuildContext context) {
    SpeechViewModel speechViewModel = Provider.of<SpeechViewModel>(context);

    final languageTranslationViewModel =
        Provider.of<LanguageTranslationViewModel>(context, listen: false);

    bool topAudioStatus = speechViewModel.getTopAudioRecordStatus;
    bool bottomAudioStatus = speechViewModel.getBottomAudioRecordStatus;

    bool isTopTalking = speechViewModel.isSpeaking[0];
    bool isBotTalking = speechViewModel.isSpeaking[1];

    const iconColor = Colors.white;

    final languageTranslation =
        languageTranslationViewModel.getLanguageTranslation;

    final originalWord = speechViewModel.getCurrentWordTranslating!.word;

    final translationWord =
        speechViewModel.getCurrentWordTranslating!.translation;

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: topPad,
                          left: horizotalPad,
                          right: horizotalPad,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: OutlinedButton(
                                      onPressed: isBotTalking
                                          ? null
                                          : () => isTopTalking
                                              ? speechViewModel.stop()
                                              : speechViewModel.speak(
                                                  translationWord, 0),
                                      child: Icon(
                                        isTopTalking
                                            ? Icons.stop
                                            : Icons.volume_up,
                                        color: isBotTalking
                                            ? Colors.grey
                                            : Theme.of(context).iconTheme.color,
                                      ),
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                          const Size(20, 30),
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () => {
                                        _copyTranslationToClipBoard(
                                            context, translationWord)
                                      },
                                      icon: const Icon(Icons.file_copy),
                                      splashColor: Colors.transparent,
                                      splashRadius: 15,
                                      iconSize: 30,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  translationWord,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: MaterialButton(
                                  shape: const CircleBorder(),
                                  onPressed: bottomAudioStatus
                                      ? null
                                      : () => speechViewModel.toggletTopRecord(
                                            context,
                                            languageTranslation.getToLanguage,
                                            languageTranslation.getFromLanguage,
                                          ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(80.0)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          HexColor('#F0B831'),
                                          HexColor('#962F4A'),
                                          HexColor('#1E307C'),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: IconTheme(
                                        data: const IconThemeData(
                                          size: 35,
                                          color: Colors.white,
                                        ),
                                        child: Icon(
                                          getPlayIcon(topAudioStatus),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: topPad, left: horizotalPad, right: horizotalPad),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 0.5),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: OutlinedButton(
                                    onPressed: isTopTalking
                                        ? null
                                        : () => isBotTalking
                                            ? speechViewModel.stop()
                                            : speechViewModel.speak(
                                                originalWord, 1),
                                    child: Icon(
                                      isBotTalking
                                          ? Icons.stop
                                          : Icons.volume_up,
                                      color: isTopTalking
                                          ? Colors.grey
                                          : Theme.of(context).iconTheme.color,
                                    ),
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                        const Size(20, 30),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () => _makeFavorite(
                                        context,
                                        speechViewModel,
                                        languageTranslationViewModel),
                                    icon: const Icon(Icons.star_rounded),
                                    splashRadius: 15,
                                    iconSize: 37.5,
                                    color: speechViewModel
                                            .getCurrentWordTranslating!.favorite
                                        ? HexColor('#ffbc00')
                                        : HexColor('#CECECE'),
                                    splashColor: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                originalWord,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                shape: const CircleBorder(),
                                onPressed: topAudioStatus
                                    ? null
                                    : () => speechViewModel.toggleBottomRecord(
                                          context,
                                          languageTranslation.getFromLanguage,
                                          languageTranslation.getToLanguage,
                                        ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(80.0)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        HexColor('#F0B831'),
                                        HexColor('#962F4A'),
                                        HexColor('#1E307C'),
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: IconTheme(
                                      data: const IconThemeData(
                                        size: 35,
                                        color: iconColor,
                                      ),
                                      child:
                                          Icon(getPlayIcon(bottomAudioStatus)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: TranslationHeader(
                  upDown: true,
                  additionalFunction: () => speechViewModel.swap(),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Provider.of<WordTranslatingViewModel>(context, listen: false)
                    .reset();
                speechViewModel.reset();
                Navigator.pop(context);
              },
              iconSize: 25,
              splashRadius: 12.5,
              splashColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
