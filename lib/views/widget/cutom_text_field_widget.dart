import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.labelText,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    super.key,
  });
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(labelText),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
