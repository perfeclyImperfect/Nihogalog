import 'package:flutter/material.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/translationHeader/translationHeader.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 15),
          child: TranslationHeader(
            additionalFunction: () {},
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home/text',
                    arguments: Provider.of<WordTranslatingViewModel>(context,
                            listen: false)
                        .getText
                        .word);
              },
              child: DefaultTextStyle.merge(
                style: const TextStyle(
                  color: Colors.black54,
                ),
                child: Text(
                  'Type the text to translate.',
                  style: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
