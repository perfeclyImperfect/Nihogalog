import 'package:flutter/material.dart';
import 'package:frontend/view_models/darkMode_view_model.dart';
import 'package:provider/provider.dart';

class _DarkModeState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    final darkModeViewModel = Provider.of<DarkModeViewModel>(context);

    return Row(
      children: [
        const Text(
          'Dark Mode',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: 'AdobeClean'),
        ),
        Switch(
          value: darkModeViewModel.getStatus(),
          onChanged: (value) async {
            await darkModeViewModel.toggle(value);
          },
          activeColor: Colors.green,
          inactiveTrackColor: Colors.grey,
          inactiveThumbColor: Colors.white,
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
