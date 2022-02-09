import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/models/translating.dart';
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
      String value, WordTranslatingViewModel textTranslationViewModel) {
    textTranslationViewModel.setText(WordTranslating(value, '', ''));
  }

  @override
  Widget build(BuildContext context) {
    final textTranslationViewModel =
        Provider.of<WordTranslatingViewModel>(context);

    final translatingViewModel = Provider.of<TranslatingViewModel>(context);

    final languageTranslationViewModel =
        Provider.of<LanguageTranslationViewModel>(context);

    return FocusScope(
      child: Focus(
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (value) => translate(value, textTranslationViewModel),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Type the text to translate.',
            suffixIcon: textTranslationViewModel.getText.word.isNotEmpty
                ? IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () => clear(textTranslationViewModel),
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
        ),
      ),
      onFocusChange: (focus) {
        translatingViewModel.setTranslating(Translating(status: focus));

        if (textTranslationViewModel.getText.word.isNotEmpty) {
          Provider.of<HistoryViewModel>(context, listen: false).add(
            HistoryWord(
                textTranslationViewModel.getText.word,
                textTranslationViewModel.getText.translation,
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
