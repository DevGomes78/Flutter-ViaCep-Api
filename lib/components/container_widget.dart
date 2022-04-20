import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Alignment? alignment;
  double? height;
  double? width;
  Widget? child;
  Color? color;

  ButtonWidget(
    this.alignment,
    this.height,
    this.width,{
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
    );
  }
}
