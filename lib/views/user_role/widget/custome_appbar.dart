import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
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
      backgroundColor: Colors.white,
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
          icon: sl<SharedPrefController>().getUser().imageLink == '' ?
          const CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage('https://i.pinimg.com/736x/40/98/2a/40982a8167f0a53dedce3731178f2ef5.jpg') ,
          ): CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(sl<SharedPrefController>().getUser().imageLink) ,
          ),
      ),
      title: Text(
        title.tr,
        style: StyleManager.headline1(fontSize: 18),
      ),
      centerTitle: true,
    );
  }
}
