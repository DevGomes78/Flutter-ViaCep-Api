import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  Alignment? alignment;
  double? height;
  double? width;
  Widget? child;
  Color? color;

  ContainerWidget(
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
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
    );
  }
}
