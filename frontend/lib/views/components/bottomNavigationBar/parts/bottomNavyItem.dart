import 'package:flutter/material.dart';

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.white,
    this.textAlign,
    this.inactiveColor = Colors.grey,
    this.active = true,
    this.customIcon,
    required this.topRightFunction,
  });

  final Widget icon;
  final Widget? customIcon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
  final bool active;
  final Function topRightFunction;
}
