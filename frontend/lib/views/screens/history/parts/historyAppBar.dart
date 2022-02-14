import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:provider/provider.dart';

import 'label.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);

    final editStatus = historyViewModel.getEditStatus;

    return AppBar(
      elevation: 1,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      backgroundColor: editStatus ? HexColor('#FFBC00') : Colors.white,
      title: editStatus
          ? Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.white,
                        onPressed: () => historyViewModel.toggleEdit(),
                        icon: const Icon(Icons.cancel_outlined),
                        iconSize: 23,
                      ),
                      const HistoryLabel(
                        color: Colors.white,
                        label: 'History',
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: const ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => historyViewModel.delete(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [
                HistoryLabel(
                  color: editStatus ? Colors.white : Colors.black,
                  label: 'History',
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory),
                      child: const Text('Edit'),
                      onPressed: () => historyViewModel.toggleEdit(),
                    ),
                  ),
                )
              ],
            ),
      bottom: editStatus
          ? PreferredSize(
              preferredSize: Size.zero,
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 23,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          "${historyViewModel.getSelected.length} Selected",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
