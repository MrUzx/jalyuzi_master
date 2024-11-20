import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius? borderRadius;

  const CustomContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60, // Default balandlik 60
      width: width, // Default kenglik optional
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor, // Default rang primaryColor
        borderRadius: borderRadius ?? BorderRadius.circular(12), // Default radius 15
      ),
      child: Center(child: child),
    );
  }
}
