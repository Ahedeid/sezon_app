import 'package:flutter/material.dart';
import 'package:sezon_app/utils/style_manager.dart';


class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: StyleManager.headline1(),
    );
  }
}
