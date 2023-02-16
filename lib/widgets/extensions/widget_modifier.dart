import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  // ...
  Widget horizontalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius(BorderRadius radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget border() {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: this,
    );
  }
}
