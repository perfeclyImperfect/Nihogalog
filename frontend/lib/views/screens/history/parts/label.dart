import 'package:flutter/cupertino.dart';

class HistoryLabel extends StatelessWidget {
  final color;

  const HistoryLabel({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'History',
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
