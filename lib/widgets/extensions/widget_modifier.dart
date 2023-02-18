import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  // ...
  Widget horizontalPadding(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Widget verticalPadding(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Widget background(Color color) => DecoratedBox(
        decoration: BoxDecoration(
          color: color,
        ),
        child: this,
      );

  Widget cornerRadius(BorderRadius radius) => ClipRRect(
        borderRadius: radius,
        child: this,
      );

  Widget align([AlignmentGeometry alignment = Alignment.center]) => Align(
        alignment: alignment,
        child: this,
      );

  Widget border() => DecoratedBox(
        decoration: BoxDecoration(border: Border.all()),
        child: this,
      );
}
