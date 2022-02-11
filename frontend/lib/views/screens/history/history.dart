import 'package:flutter/material.dart';
import 'package:frontend/models/wordTranslating.dart';
import 'package:frontend/view_models/wordTranslating_view_model.dart';
import 'package:frontend/views/screens/history/parts/historyAppBar.dart';
import 'package:frontend/views/screens/history/parts/translationListTile.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:provider/provider.dart';

import '../../components/drawer/drawer.dart';

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);

    final tempHistory = historyViewModel.getHistory;
    final editStatus = historyViewModel.getEditStatus;

    final historyListTileWidgets = [
      for (int i = 0; i < tempHistory.length; i++)
        TranslationListTile(
          onTap: editStatus
              ? () => historyViewModel.selectToggle(i)
              : () {
                  Provider.of<WordTranslatingViewModel>(context, listen: false)
                      .setText(
                    WordTranslating(
                        tempHistory[i].getOriginalWord,
                        tempHistory[i].getTranslationWord,
                        tempHistory[i].getToLanguage),
                  );

                  Navigator.pushNamed(context, '/home/text',
                      arguments: tempHistory[i].getOriginalWord);
                },
          originalWord: tempHistory[i].getOriginalWord,
          translationWord: tempHistory[i].getTranslationWord,
          isSelected: historyViewModel.getSelected.contains(i),
        )
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(editStatus ? 100 : 56),
        child: const HistoryAppBar(),
      ),
      drawer: editStatus ? null : const DrawerScreen(),
      body: SingleChildScrollView(
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
      ),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static String route = '/history';

  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}
