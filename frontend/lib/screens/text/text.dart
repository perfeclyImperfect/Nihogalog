import 'package:flutter/material.dart';

import '../../components/translationHeader/translationHeader.dart';

class TextScreen extends StatelessWidget {
  static String route = '/home/text';

  const TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(fontSize: 14),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const TranslationHeader(
          fromLanguage: 'Tagalog',
          toLanguage: 'Nihongo',
        ),
      ),
      body: Column(
        children: const [
          TranslationHeader(
            fromLanguage: 'Tagalog',
            toLanguage: 'Nihongo',
          ),
          Expanded(
            child: Text('sad'),
          )
        ],
      ),
    );
  }
}
