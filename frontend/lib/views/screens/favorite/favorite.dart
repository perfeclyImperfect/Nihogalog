import 'package:flutter/material.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/views/components/appbar/customAppBar.dart';
import 'package:frontend/view_models/favorite_view_model.dart';
import 'package:frontend/view_models/history_view_model.dart';

import 'package:frontend/views/components/list/CustomList.dart';
import 'package:frontend/views/components/drawer/drawer.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  static String route = '/favorites';

  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);

    final bool editStatus = historyViewModel.getEditStatus;
    final List<HistoryWord> tempFavorites = historyViewModel.getFavorites();

    return Scaffold(
      appBar: CustomAppBar(
        label: "Favorite",
        viewModel: historyViewModel,
        deleteMethod: () {
          historyViewModel.deleteFavorites();
        },
        selectAllMethod: () {
          historyViewModel.selectAllFavorites();
        },
      ),
      drawer: editStatus ? null : const DrawerScreen(),
      body: CustomList(
        tempList: tempFavorites,
        favoritable: false,
        viewModel: historyViewModel,
      ),
    );
  }
}
