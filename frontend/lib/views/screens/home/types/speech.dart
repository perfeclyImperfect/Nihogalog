import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';
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
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Tap the '),
              Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      HexColor('#F0B831'),
                      HexColor('#962F4A'),
                      HexColor('#1E307C'),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: IconTheme(
                    data: IconThemeData(
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.mic_outlined,
                      size: 25,
                    ),
                  ),
                ),
              ),
              const Text(' and start talking.')
            ],
          ),
        )
      ],
    );
  }
}
