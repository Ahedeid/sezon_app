import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/style_manager.dart';

class ListTilePurchaseWidget extends StatelessWidget {
  const ListTilePurchaseWidget({
    required this.onTap,
    required this.title,
    required this.icon,
    super.key,
  });
  final void Function()? onTap;
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(icon),
        title: Text(
          title,
          style: StyleManager.headline2,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
