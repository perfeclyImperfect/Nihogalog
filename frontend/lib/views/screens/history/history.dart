import 'package:flutter/material.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:frontend/views/components/appbar/customAppBar.dart';
import 'package:frontend/views/components/list/CustomList.dart';
import 'package:frontend/views/screens/history/parts/translationListTile.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:provider/provider.dart';

import '../../components/drawer/drawer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static String route = '/history';

  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);

    final tempHistory = historyViewModel.getHistory;
    final editStatus = historyViewModel.getEditStatus;

    final historyListTileWidgets = [
      for (int i = 0; i < tempHistory.length; i++)
        TranslationListTile(
          onTap: editStatus
              ? () => historyViewModel.toggleSelect(i)
              : () {
                  Provider.of<WordTranslatingViewModel>(context, listen: false)
                      .setText(
                    WordTranslating(
                        tempHistory[i].getOriginalWord,
                        tempHistory[i].getTranslationWord,
                        tempHistory[i].getToLanguage,
                        tempHistory[i].getFavorite ?? false),
                  );

                  Navigator.pushNamed(context, '/home/text',
                      arguments: tempHistory[i].getOriginalWord);
                },
          historyWord: tempHistory[i],
          isSelected: historyViewModel.getSelected.contains(i),
        )
    ];

    return Scaffold(
      appBar: CustomAppBar(
        label: "History",
        viewModel: historyViewModel,
        deleteMethod: () => historyViewModel.delete(),
        selectAllMethod: () => historyViewModel.selectAll(),
      ),
      drawer: editStatus ? null : const DrawerScreen(),
      body: CustomList(
        tempList: historyViewModel.getHistory,
        favoritable: true,
        viewModel: historyViewModel,
      ),
    );
  }
}
