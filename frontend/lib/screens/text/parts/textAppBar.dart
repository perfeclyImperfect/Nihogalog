import 'package:flutter/material.dart';

import '../../../components/translationHeader/translationHeader.dart';

class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TextAppBar({Key? key, this.preferredHeight = 40}) : super(key: key);

  final double preferredHeight;

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
        padding: EdgeInsets.only(right: 50, top: 5, bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TranslationHeader(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
