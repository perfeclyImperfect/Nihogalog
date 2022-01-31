import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:frontend/view_models/textTranslation_view_model.dart';

import 'parts/textAppBar.dart';
import 'parts/translationTextField.dart';

class TextScreen extends StatelessWidget {
  static String route = '/home/text';

  final _translationController = TextEditingController();

  TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTranslationViewModel =
        Provider.of<TextTranslationViewModel>(context);

    bool isThereWord = textTranslationViewModel.getText.text.isNotEmpty;

    return Scaffold(
      appBar: const TextAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: isThereWord
                  ? OutlinedButton(
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
                    )
                  : null,
            ),
            TranslationTextField(
              controller: _translationController,
            ),
            isThereWord
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
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
                        const Text(
                          'こんにちは元気ですか',
                          style: TextStyle(fontSize: 25),
                        ),
                        const Text("Kon'nichiwa genkidesuka")
                      ],
                    ),
                  )
                : const Text(''),
            isThereWord
                ? Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.file_copy),
                          splashColor: Colors.transparent,
                          splashRadius: 1,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star),
                          splashColor: Colors.transparent,
                          splashRadius: 1,
                        )
                      ],
                    ),
                  )
                : const Text('')
          ],
        ),
      ),
    );
  }
}
