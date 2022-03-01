import 'package:flutter/material.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:frontend/views/components/label/label.dart';

import 'package:frontend/utils/hexColor.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.label,
      required this.viewModel,
      required this.deleteMethod,
      required this.selectAllMethod})
      : super(key: key);

  final String label;
  final HistoryViewModel viewModel;
  final Function deleteMethod;
  final Function selectAllMethod;

  @override
  Size get preferredSize => Size.fromHeight(viewModel.getEditStatus ? 100 : 56);

  @override
  Widget build(BuildContext context) {
    final editStatus = viewModel.getEditStatus;

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
                        onPressed: () => viewModel.toggleEdit(),
                        icon: const Icon(Icons.cancel_outlined),
                        iconSize: 23,
                      ),
                      HistoryLabel(
                        color: Colors.white,
                        label: label,
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
                            onPressed: () {
                              deleteMethod();
                            },
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
                  label: label,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory),
                      child: const Text('Edit'),
                      onPressed: () => viewModel.toggleEdit(),
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
                      SizedBox(
                        width: 35,
                        child: IconButton(
                          onPressed: () => selectAllMethod(),
                          icon: viewModel.getSelected.isEmpty
                              ? const Icon(Icons.check_circle_outline)
                              : const Icon(Icons.cancel_outlined),
                          iconSize: 23,
                          splashRadius: 12.5,
                          color: Colors.white,
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Text(
                            "${viewModel.getSelected.length} Selected",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
