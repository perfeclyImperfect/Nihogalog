import 'package:flutter/material.dart';

class BottomNavyBarItem {
<<<<<<< HEAD
  BottomNavyBarItem(
      {required this.icon,
      required this.title,
      this.activeColor = Colors.white,
      this.textAlign,
      this.inactiveColor = Colors.black,
      this.active = true,
      required this.route});
=======
  BottomNavyBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.white,
    this.textAlign,
    this.inactiveColor = Colors.grey,
    this.active = true,
    required this.topRightFunction,
  });
>>>>>>> a6aaab6375c7137840e812b06298299b42c31861

  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
  final bool active;
  final Function topRightFunction;
}
