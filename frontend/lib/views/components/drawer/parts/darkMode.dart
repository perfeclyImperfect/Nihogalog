import 'package:flutter/material.dart';
import 'package:frontend/view_models/darkMode_view_model.dart';
import 'package:provider/provider.dart';

class _DarkModeState extends State<DarkMode> {
  bool _darkmode = false;

  darkmodeInit(final DarkModeViewModel darkModeViewModel) async {
    _darkmode = await darkModeViewModel.isEmpty()
        ? false
        : await darkModeViewModel.getStatus();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final DarkModeViewModel darkModeViewModel =
        Provider.of<DarkModeViewModel>(context);

    darkmodeInit(darkModeViewModel);

    return Row(
      children: [
        const Text(
          'Dark Mode',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          value: _darkmode,
          onChanged: (value) {
            _darkmode = value;

            darkModeViewModel.toggle(value);
          },
          activeColor: Colors.green,
          inactiveTrackColor: Colors.grey,
          inactiveThumbColor: Colors.grey,
        ),
      ],
    );
  }
}

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  State<DarkMode> createState() => _DarkModeState();
}
