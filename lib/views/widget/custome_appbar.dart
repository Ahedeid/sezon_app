import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/utils/assets_path.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.bottom,
    this.height = 58,
    super.key,
  });
  final PreferredSizeWidget? bottom;
  final String title;
  final double height;
  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(RouteName.notifications);
          },
          icon: const Icon(
            Icons.notifications,
            color: ColorManager.grayColor,
          ),
        )
      ],
      leading: IconButton(
          onPressed: () {
            Get.toNamed(RouteName.profileRoute);
          },
          icon: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(AssetPath.placeholder),
          )),
      title: Text(
        title.tr,
        style: StyleManager.headline1(fontSize: 18),
      ),
      centerTitle: true,
    );
  }
}
