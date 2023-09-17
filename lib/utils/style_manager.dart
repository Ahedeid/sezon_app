import 'package:flutter/material.dart';

class StyleManager {
  static TextStyle headline1({double? fontSize}) => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: fontSize ?? 26,
      );
  static const TextStyle headline2 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle headline3 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static TextStyle smallText(
          {Color? color,
          FontWeight? fontWeight,
          TextDecorationStyle? decorationStyle,
          TextDecoration? decoration}) =>
      TextStyle(
          color: color ?? Colors.grey.shade600,
          fontSize: 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          decorationStyle: decorationStyle,
          decoration: decoration);
  static const TextStyle labelStyle = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
