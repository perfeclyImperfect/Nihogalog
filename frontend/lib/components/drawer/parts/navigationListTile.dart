import 'package:flutter/material.dart';

class NavigationListTile extends StatelessWidget {
  const NavigationListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(context),
      title: Row(
        children: [
          Icon(icon),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
