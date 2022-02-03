import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:frontend/view_models/languageTranslation_view_model.dart';

class _TranslationHeader extends State<TranslationHeader> {
  @override
  Widget build(BuildContext context) {
    final LanguageTranslationViewModel languageTranslationViewModel =
        Provider.of<LanguageTranslationViewModel>(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                languageTranslationViewModel.getFromLanguage,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 37,
            height: 35,
            child: TextButton(
              onPressed: () => languageTranslationViewModel.swapLanguage(),
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: Icon(Icons.swap_horiz),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                languageTranslationViewModel.getToLanguage,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TranslationHeader extends StatefulWidget {
  const TranslationHeader({Key? key}) : super(key: key);

  @override
  State<TranslationHeader> createState() => _TranslationHeader();
}
