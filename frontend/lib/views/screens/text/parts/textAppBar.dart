import 'package:flutter/material.dart';
import 'package:frontend/view_models/languageTranslation_view_model.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:provider/provider.dart';

import '../../../components/translationHeader/translationHeader.dart';
import 'package:frontend/view_models/translating_view_%20model.dart';

class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TextAppBar(
      {Key? key, this.preferredHeight = 40, required this.controller})
      : super(key: key);

  final double preferredHeight;
  final TextEditingController controller;

  swap(context) {
    Provider.of<WordTranslatingViewModel>(context, listen: false).swap(
      Provider.of<LanguageTranslationViewModel>(
        context,
        listen: false,
      ).getLanguageTranslation,
    );

    controller.text =
        Provider.of<WordTranslatingViewModel>(context, listen: false)
            .getText
            .translation;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: const TextStyle(fontSize: 14),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Provider.of<WordTranslatingViewModel>(context, listen: false).reset();
          Provider.of<TranslatingViewModel>(context, listen: false).reset();

          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 50, top: 5, bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TranslationHeader(
            additionalFunction: () => swap(context),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
