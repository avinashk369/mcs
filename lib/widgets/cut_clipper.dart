import 'package:flutter/material.dart';

class CutClipper extends CustomClipper<Path> {
  CutClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    print("$right width size ${size.width / 2}");
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CutClipper oldClipper) => true;
}
