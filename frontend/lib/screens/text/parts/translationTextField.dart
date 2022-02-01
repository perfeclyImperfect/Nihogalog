import 'package:frontend/models/textTranslation.dart';
import 'package:frontend/models/translating.dart';
import 'package:frontend/view_models/textTranslation_view_model.dart';
import 'package:frontend/view_models/translating_view_%20model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class _TranslationTextFieldState extends State<TranslationTextField> {
  void clear(TextTranslationViewModel textTranslationViewModel) {
    widget.controller.clear();
    textTranslationViewModel.setText(TextTranslation(text: ''));
  }

  void translate(
    String value,
    TextTranslationViewModel textTranslationViewModel,
  ) {
    textTranslationViewModel.setText(TextTranslation(text: value));
  }

  @override
  Widget build(BuildContext context) {
    final TextTranslationViewModel textTranslationViewModel =
        Provider.of<TextTranslationViewModel>(context);

    final TranslatingViewModel translatingViewModel =
        Provider.of<TranslatingViewModel>(context);

    return FocusScope(
      child: Focus(
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (value) => translate(value, textTranslationViewModel),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Type the text to translate.',
            suffixIcon: textTranslationViewModel.getText.text.isNotEmpty
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
