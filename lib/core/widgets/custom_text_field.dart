import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;

  final String labelText;

  final String hintText;

  final String? Function(String?) validatorFunction;

  final bool isPassword;

  CustomTextField({
    required this.textController,
    required this.labelText,
    required this.hintText,
    required this.validatorFunction,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: isPassword,
      validator: validatorFunction,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
