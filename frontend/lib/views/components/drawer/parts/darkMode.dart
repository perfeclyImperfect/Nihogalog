import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:frontend/view_models/darkMode_view_model.dart';

class _DarkModeState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    final darkModeViewModel = Provider.of<DarkModeViewModel>(context);

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
          child: Text(
            'Dark Mode',
            style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
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
