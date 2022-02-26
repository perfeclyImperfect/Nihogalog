import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class HistoryLabel extends StatelessWidget {
  final Color color;
  final String label;

  const HistoryLabel({Key? key, required this.color, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }
}
