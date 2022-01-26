import 'package:flutter/material.dart';

class _DarkModeState extends State<DarkMode> {
  bool _darkmode = false;

  @override
  Widget build(BuildContext context) {
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
          onChanged: (onOff) {
            setState(
              () {
                _darkmode = onOff;
              },
            );
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
