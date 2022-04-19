import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String? text;

  ButtonWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        alignment: Alignment.center,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green,
          gradient: const LinearGradient(
              colors: [(Colors.green), (Colors.black)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}