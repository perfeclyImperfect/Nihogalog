import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Icon(
            icon,
            size: 40,
          ),
          Container(
            width: 20,
          ),
          Text(
            text,
            style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
