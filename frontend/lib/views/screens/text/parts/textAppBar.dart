import 'package:flutter/material.dart';
import 'package:frontend/models/textTranslation.dart';
import 'package:frontend/models/translating.dart';
import 'package:frontend/view_models/textTranslation_view_model.dart';
import 'package:provider/provider.dart';

import '../../../components/translationHeader/translationHeader.dart';
import 'package:frontend/view_models/translating_view_%20model.dart';

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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Provider.of<TextTranslationViewModel>(context, listen: false).reset();
          Provider.of<TranslatingViewModel>(context, listen: false).reset();

          Navigator.of(context).pop();
        },
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
