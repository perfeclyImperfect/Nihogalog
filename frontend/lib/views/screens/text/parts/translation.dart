import 'package:flutter/material.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:provider/provider.dart';

class Translation extends StatelessWidget {
  const Translation({Key? key, required this.micVisibility}) : super(key: key);

  final bool micVisibility;

  @override
  Widget build(BuildContext context) {
    final wordTranslationViewModel =
        Provider.of<WordTranslatingViewModel>(context);

    bool isTopTalking = wordTranslationViewModel.isSpeaking[0];
    bool isBotTalking = wordTranslationViewModel.isSpeaking[1];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: micVisibility,
            child: Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: isTopTalking
                    ? null
                    : () => isBotTalking
                        ? wordTranslationViewModel.stop()
                        : wordTranslationViewModel.speak(
                            wordTranslationViewModel.getText.translation, 1),
                child: Icon(
                  isBotTalking ? Icons.stop : Icons.volume_up,
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
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            wordTranslationViewModel.getText.translation,
            style: const TextStyle(fontSize: 25),
          ),
          Text(wordTranslationViewModel.getText.translationPronounciation)
        ],
      ),
    );
  }
}
