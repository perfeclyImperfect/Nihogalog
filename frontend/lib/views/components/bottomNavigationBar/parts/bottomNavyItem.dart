import 'package:flutter/material.dart';

class BottomNavyBarItem {
  BottomNavyBarItem(
      {required this.icon,
      required this.title,
      this.activeColor = Colors.white,
      this.textAlign,
      this.inactiveColor = Colors.black,
      this.active = true,
      required this.route});

  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
  final bool active;
  final String route;
}
