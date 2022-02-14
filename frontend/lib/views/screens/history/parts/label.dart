import 'package:flutter/cupertino.dart';

class HistoryLabel extends StatelessWidget {
  final Color color;
  final String label;

  const HistoryLabel({Key? key, required this.color, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${label}',
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
