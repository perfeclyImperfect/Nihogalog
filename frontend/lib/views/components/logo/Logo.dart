import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo(
      {Key? key,
      this.padding = const EdgeInsets.all(0),
      this.scale = 7,
      this.fontSize = 23})
      : super(key: key);

  final EdgeInsetsGeometry padding;
  final double scale;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/nihogalog_logo.png',
                scale: scale,
              ),
            ),
            Text(
              'niho',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
            Text(
              'galog',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: fontSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
