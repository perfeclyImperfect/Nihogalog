import 'package:flutter/material.dart';
import 'package:frontend/views/components/button/swapButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:frontend/view_models/languageTranslation_view_model.dart';

class TranslationHeader extends StatelessWidget {
  const TranslationHeader(
      {Key? key,
      this.height = 37.0,
      this.width = 300.0,
      this.upDown = false,
      required this.additionalFunction})
      : super(key: key);

  final double height;
  final double width;
  final bool upDown;
  final Function additionalFunction;

  @override
  Widget build(BuildContext context) {
    final languageTranslationViewModel =
        Provider.of<LanguageTranslationViewModel>(context);

    return Container(
      height: height,
      width: width,
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
                languageTranslationViewModel
                        .getLanguageTranslation.getFromLanguage ??
                    'Tagalog',
                style: GoogleFonts.raleway(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 37,
            height: 35,
            child: SwapButton(
              additionalFunction: additionalFunction,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: upDown ? 2 : 0,
                child: Text(
                  languageTranslationViewModel
                          .getLanguageTranslation.getToLanguage ??
                      'Nihongo',
                  style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
