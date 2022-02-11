import 'package:flutter/material.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:provider/provider.dart';

import '../../../components/translationHeader/translationHeader.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
          child: TranslationHeader(),
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
                child: const Text('Type the text to translate.'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
