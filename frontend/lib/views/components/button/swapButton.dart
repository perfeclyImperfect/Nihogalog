import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/view_models/languageTranslation_view_model.dart';
import 'package:provider/provider.dart';

class _SwapButtonState extends State<SwapButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    setRotation(90);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  setRotation(int degrees) {
    final angle = degrees * pi / 180;

    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    final languageTranslationViewModel =
        Provider.of<LanguageTranslationViewModel>(context, listen: false);

    return AnimatedBuilder(
      animation: animation,
      child: TextButton(
        onPressed: () {
          setRotation(180);
          controller.forward(from: 0);

          widget.additionalFunction();
          languageTranslationViewModel.swapLanguage();
        },
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
      builder: (context, child) => Transform.rotate(
        angle: animation.value,
        child: child,
      ),
    );
  }
}

class SwapButton extends StatefulWidget {
  const SwapButton({Key? key, required this.additionalFunction})
      : super(key: key);

  final Function additionalFunction;

  @override
  State<StatefulWidget> createState() => _SwapButtonState();
}
