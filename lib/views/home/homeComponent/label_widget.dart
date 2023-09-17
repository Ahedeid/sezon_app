import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_manager.dart';
import '../../../../utils/style_manager.dart';


class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 5,
          height: 18,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: ColorManager.redColor,
              borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text.tr,
          style: StyleManager.headline2,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
