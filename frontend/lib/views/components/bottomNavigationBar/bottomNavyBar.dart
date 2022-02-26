import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'parts/bottomNavyItem.dart';
import 'parts/itemWidget.dart';
import '../../../utils/hexColor.dart';

class CustomAnimatedBottomBar extends StatelessWidget {
  const CustomAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Badge(
      badgeColor: Theme.of(context).scaffoldBackgroundColor,
      position: BadgePosition.topEnd(end: 30, top: -35),
      toAnimate: false,
      borderSide: BorderSide.none,
      elevation: 4,
      badgeContent: Container(
        margin: const EdgeInsets.all(5),
        child: MaterialButton(
          shape: const CircleBorder(),
          onPressed: items[selectedIndex].active
              ? () => items[selectedIndex].topRightFunction()
              : null,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(80.0)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  HexColor('#F0B831'),
                  HexColor('#962F4A'),
                  HexColor('#1E307C'),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: IconTheme(
                data: IconThemeData(
                  size: iconSize,
                  color: Colors.white,
                ),
                child: items[selectedIndex].icon,
              ),
            ),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(60),
          ),
          color: bgColor,
          boxShadow: [
            if (showElevation)
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
              ),
          ],
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: containerHeight,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: ItemWidget(
                    item: item,
                    iconSize: iconSize,
                    isSelected: index == selectedIndex,
                    backgroundColor: bgColor,
                    itemCornerRadius: itemCornerRadius,
                    animationDuration: animationDuration,
                    curve: curve,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
