import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  String? labelText;
  String? hintText;
  Widget? icon;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;



  TextFormWidget(
      this.labelText,
      this.hintText,{
        this.icon,
        this.controller,
        this.validator,

      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: null==hintText?'':hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: icon,
      ),
      controller: controller,
      validator:validator ,

    );
  }
}