import 'package:flutter/material.dart';
import 'package:frontend/views/screens/history/parts/translationListTile.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:provider/provider.dart';

import '../../components/drawer/drawer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static String route = '/history';

  @override
  Widget build(BuildContext context) {
    HistoryViewModel historyViewModel = Provider.of<HistoryViewModel>(context);

    final tempHistory = historyViewModel.getHistory;

    for (int i = 0; i < tempHistory.length; i++) {
      print(tempHistory[i].getOriginalWord);
    }

    final historyListTileWidgets = [
      for (int i = 0; i < tempHistory.length; i++)
        TranslationListTile(
          onTap: () {},
          originalWord: tempHistory[i].getOriginalWord,
          translationWord: tempHistory[i].getTranslationWord,
        )
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text(
              'History',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text('Edit'),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const DrawerScreen(),
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
