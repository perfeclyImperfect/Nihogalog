import 'package:flutter/material.dart';

import '../../../components/translationHeader/translationHeader.dart';

class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TextAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: const TextStyle(fontSize: 14),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(right: 50),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TranslationHeader(
            fromLanguage: 'Tagalog',
            toLanguage: 'Nihongo',
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
