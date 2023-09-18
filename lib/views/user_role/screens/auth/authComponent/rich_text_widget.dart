import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sezon_app/utils/style_manager.dart';


class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.onTap,
    required this.text1,
    required this.text2,
  });
final void Function()? onTap;
final String text1;
final String text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:text1 ,
            style: StyleManager.smallText(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text:text2 ,
            style: StyleManager.smallText(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                decorationStyle: TextDecorationStyle.solid,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
