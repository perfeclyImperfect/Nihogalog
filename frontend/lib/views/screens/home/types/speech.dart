import 'package:flutter/material.dart';
import 'package:frontend/views/components/translationHeader/translationHeader.dart';

class Speech extends StatelessWidget {
  const Speech({Key? key}) : super(key: key);

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
        const Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Tap the microphone and start speaking.',
            ),
          ),
        )
      ],
    );
  }
}
