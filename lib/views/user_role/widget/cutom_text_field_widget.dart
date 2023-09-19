import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
     this.hintText,
    required this.labelText,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.minLines = 1,
    this.maxLines,
    this.readOnly =false,
    super.key,
  });
  final String? hintText;
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int minLines;
  final int? maxLines;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      minLines:minLines ,
      maxLines:maxLines ,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(labelText,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
