import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {

  double? height;
  double? width;
  Widget? child;
  Color? color;

  ContainerWidget(

    this.height,
    this.width,{
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: color,
      ),
    );
  }
}
