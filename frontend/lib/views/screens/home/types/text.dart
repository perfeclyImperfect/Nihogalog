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
            child: Text('Tap the icon to translate'),
          ),
        )
      ],
    );
  }
}
