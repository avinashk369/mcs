import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  final double holeRadius;

  TicketClipper({required this.holeRadius});
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 2), radius: holeRadius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: holeRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
