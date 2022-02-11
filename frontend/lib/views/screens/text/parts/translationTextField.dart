import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/translating.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:frontend/view_models/languageTranslation_view_model.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:frontend/view_models/translating_view_%20model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class _TranslationTextFieldState extends State<TranslationTextField> {
  void clear(WordTranslatingViewModel textTranslationViewModel) {
    widget.controller.clear();
    textTranslationViewModel.reset();
  }

  void translate(
      String value,
      WordTranslatingViewModel wordTranslatingViewModel,
      LanguageTranslationViewModel languageTranslationViewModel) async {
    wordTranslatingViewModel.translate(
        value, languageTranslationViewModel.getLanguageTranslation);
  }

  @override
  Widget build(BuildContext context) {
    final wordTranslatingViewModel =
        Provider.of<WordTranslatingViewModel>(context);

    final translatingViewModel = Provider.of<TranslatingViewModel>(context);

    final languageTranslationViewModel =
        Provider.of<LanguageTranslationViewModel>(context);

    return FocusScope(
      child: Focus(
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (value) => translate(
              value, wordTranslatingViewModel, languageTranslationViewModel),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Type the text to translate.',
            suffixIcon: wordTranslatingViewModel.getText.word.isNotEmpty
                ? IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () => clear(wordTranslatingViewModel),
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
        ),
      ),
      onFocusChange: (focus) {
        translatingViewModel.setTranslating(Translating(status: focus));
        print(focus);

        print(wordTranslatingViewModel.getText.word);
        print(wordTranslatingViewModel.getText.translation);

        print(wordTranslatingViewModel.getText.word.isNotEmpty);

        if (wordTranslatingViewModel.getText.word.isNotEmpty) {
          print('come heres');
          Provider.of<HistoryViewModel>(context, listen: false).add(
            HistoryWord(
                wordTranslatingViewModel.getText.word,
                wordTranslatingViewModel.getText.translation,
                wordTranslatingViewModel.getText.translationPronounciation,
                languageTranslationViewModel
                        .getLanguageTranslation.getFromLanguage ??
                    'Tagalog',
                languageTranslationViewModel
                        .getLanguageTranslation.getToLanguage ??
                    'Nihogalog',
                false),
          );
        }
      },
    );
  }
}

class TranslationTextField extends StatefulWidget {
  const TranslationTextField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _TranslationTextFieldState();
}
