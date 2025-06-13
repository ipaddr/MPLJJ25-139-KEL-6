import 'package:flutter/material.dart';

class CustomPageTransformer extends StatelessWidget {
  final Widget child;
  final double position;

  CustomPageTransformer({required this.child, required this.position});

  @override
  Widget build(BuildContext context) {
    double scale = 1 - (position.abs() * 0.3); // Zoom effect
    double translationX = -position * MediaQuery.of(context).size.width;

    return Transform(
      transform: Matrix4.identity()
        ..translate(translationX)
        ..scale(scale),
      child: Opacity(
        opacity: 1 - position.abs(),
        child: child,
      ),
    );
  }
}
