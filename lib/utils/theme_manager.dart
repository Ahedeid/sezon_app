import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';

class ThemeManager {
  static var theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Tajawal',
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 15,
      ),
      hintStyle: StyleManager.smallText(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: ColorManager.grayColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: ColorManager.grayColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: ColorManager.redColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: ColorManager.redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      ),
      labelStyle: StyleManager.labelStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.redColor,
        maximumSize: const Size(double.infinity, 46),
        minimumSize: const Size(double.infinity, 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  );
}
