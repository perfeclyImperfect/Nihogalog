import 'package:frontend/models/textTranslation.dart';
import 'package:frontend/view_models/textTranslation_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class _TranslationTextFieldState extends State<TranslationTextField> {
  void clear(TextTranslationViewModel test) {
    widget.controller.clear();
    test.setText(TextTranslation(text: ''));
  }

  void translate(String value, TextTranslationViewModel test) {
    test.setText(TextTranslation(text: value));
  }

  @override
  Widget build(BuildContext context) {
    var textTranslationViewModel =
        Provider.of<TextTranslationViewModel>(context);

    return TextField(
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
