import 'package:flutter/material.dart';

import '../utils/theme_constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      this.isActive = false,
      required this.onTap,
      this.isLoading = false,
      required this.child});
  final bool isActive;
  final bool isLoading;
  final Function onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(48),
        // onPrimary: Colors.white,
        // primary: isLoading ? Colors.white24 : const Color(0xff1B5E20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
      onPressed: isActive ? () => onTap() : null,
      child: isLoading
          ? const CircularProgressIndicator.adaptive(
              backgroundColor: secondaryLight,
              valueColor: AlwaysStoppedAnimation<Color>(secondaryLight),
              strokeWidth: 2,
            )
          : child,
    );
    ;
  }
}
