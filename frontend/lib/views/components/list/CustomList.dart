import 'package:flutter/material.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/models/languageTranslation.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:frontend/view_models/languageTranslation_view_model.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:provider/provider.dart';

import 'CustomListTile.dart';

class CustomList extends StatelessWidget {
  const CustomList(
      {Key? key,
      required this.tempList,
      required this.favoritable,
      required this.viewModel})
      : super(key: key);

  final List<HistoryWord> tempList;
  final bool favoritable;
  final HistoryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final editStatus = viewModel.getEditStatus;

    final historyListTileWidgets = [
      for (int i = 0; i < tempList.length; i++)
        CustomListTile(
          onTap: editStatus
              ? () => viewModel.toggleSelect(i)
              : () {
                  Provider.of<WordTranslatingViewModel>(context, listen: false)
                      .setText(
                    WordTranslating(
                        tempList[i].getOriginalWord,
                        tempList[i].getTranslationWord,
                        tempList[i].getPronounciation,
                        tempList[i].getFavorite ?? false),
                  );

                  Provider.of<LanguageTranslationViewModel>(context,
                          listen: false)
                      .setLanguageTranslation(
                    LanguageTranslation(
                        tempList[i].getFromLanguage, tempList[i].getToLanguage),
                  );

                  Navigator.pushNamed(context, '/home/text',
                      arguments: tempList[i].getOriginalWord);
                },
          historyWord: tempList[i],
          isSelected: viewModel.getSelected.contains(i),
          favoritable: favoritable,
          viewModel: viewModel,
        )
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          for (var i in historyListTileWidgets)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: i,
            ),
        ],
      ),
    );
  }
}
