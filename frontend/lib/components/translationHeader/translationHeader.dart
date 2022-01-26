import 'package:flutter/material.dart';

class _TranslationHeader extends State<TranslationHeader> {
  void swap() {
    setState(() {
      _reverse = !_reverse;
    });
  }

  bool _reverse = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _reverse ? widget.fromLanguage : widget.toLanguage,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 37,
            height: 35,
            child: TextButton(
              onPressed: () => swap(),
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: Icon(Icons.swap_horiz),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _reverse ? widget.toLanguage : widget.fromLanguage,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TranslationHeader extends StatefulWidget {
  const TranslationHeader({
    Key? key,
    required this.fromLanguage,
    required this.toLanguage,
  }) : super(key: key);

  final String fromLanguage;
  final String toLanguage;

  @override
  State<TranslationHeader> createState() => _TranslationHeader();
}
