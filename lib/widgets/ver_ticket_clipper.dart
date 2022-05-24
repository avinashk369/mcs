import 'package:flutter/material.dart';

/// [VerTicketBothSidesClipper], can be used with [ClipPath] widget, and clips the widget like a movie ticket
class VerTicketBothSidesClipper extends CustomClipper<Path> {
  final double holeRadius;

  VerTicketBothSidesClipper({required this.holeRadius});
  @override
  Path getClip(Size size) {
    Path path = Path();
    print("height ${size.height}");
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, 0.0),
      radius: holeRadius,
    ));
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: holeRadius,
    ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
