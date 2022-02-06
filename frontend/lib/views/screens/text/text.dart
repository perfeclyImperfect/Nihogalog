import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:provider/provider.dart';

import 'package:frontend/views/screens/text/parts/translation.dart';
import 'package:frontend/view_models/textTranslation_view_model.dart';
import 'package:frontend/view_models/translating_view_%20model.dart';

import 'parts/textAppBar.dart';
import 'parts/translationTextField.dart';

class TextScreen extends StatelessWidget {
  static String route = '/home/text';

  final _translationController = TextEditingController();

  TextScreen({Key? key}) : super(key: key);

  void _copyTranslationToClipBoard(context) {
    Clipboard.setData(ClipboardData(
            text: Provider.of<TextTranslationViewModel>(context, listen: false)
                .getText
                .word))
        .then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Original text copied to clipboard"),
          ),
        );
      },
    );
  }

  void _makeFavorite(context) {}

  @override
  Widget build(BuildContext context) {
    final TextTranslationViewModel textTranslationViewModel =
        Provider.of<TextTranslationViewModel>(context);

    final TranslatingViewModel translatingViewModel =
        Provider.of<TranslatingViewModel>(context);

    // final FavoriteViewModel favoriteViewModel =
    //     Provider.of<FavoriteViewModel>(context);

    bool isThereWord = textTranslationViewModel.getText.word.isNotEmpty;
    bool status = translatingViewModel.getTranslating.status;

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (currentFocus.hasFocus && !currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const TextAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Column(
            children: [
              Visibility(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.volume_up,
                      color: Colors.black,
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(20, 30),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                ),
                visible: status ? false : isThereWord,
              ),
              TranslationTextField(
                controller: _translationController,
              ),
              Visibility(
                child: Translation(
                  micVisibility: status ? false : isThereWord,
                ),
                visible: status ? true : isThereWord,
              ),
              Visibility(
                child: Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _copyTranslationToClipBoard(context),
                        icon: const Icon(Icons.file_copy),
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        iconSize: 35,
                        color: Colors.grey,
                      ),
                      IconButton(
                        onPressed: () => _makeFavorite(context),
                        icon: const Icon(Icons.star_rounded),
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        iconSize: 40,
                        color:
                            false ? HexColor('#ffbc00') : HexColor('#CECECE'),
                      )
                    ],
                  ),
                ),
                visible: status ? false : isThereWord,
              )
            ],
          ),
        ),
      ),
    );
  }
}