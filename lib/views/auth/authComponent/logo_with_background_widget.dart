import 'package:flutter/material.dart';

import '../../../../utils/assets_path.dart';
class LogoWithBackgroundWidget extends StatelessWidget {
  const LogoWithBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPath.authBackground,
      fit: BoxFit.fitWidth,
      width: double.infinity,
      height: 300,
      alignment: Alignment.topCenter,
    );
  }
}
