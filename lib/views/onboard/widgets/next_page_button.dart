import 'package:mcs/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    required this.onPressed,
  }) : assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: secondaryLight,
      child: const Icon(
        Icons.arrow_forward_ios,
        color: darkColor,
        size: 32.0,
      ),
      onPressed: onPressed,
    );
  }
}
