import 'package:flutter/material.dart';
import 'package:frontend/views/components/appbar/customAppBar.dart';
import 'package:frontend/views/components/list/CustomList.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:provider/provider.dart';

import '../components/drawer/drawer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static String route = '/history';

  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);

    final editStatus = historyViewModel.getEditStatus;

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
