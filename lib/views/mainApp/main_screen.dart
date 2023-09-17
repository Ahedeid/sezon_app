import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/favorite_controller.dart';
import 'package:sezon_app/controllers/main_app/main_controller.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/controllers/home_controllers/home_controller.dart';

class MainScreen extends GetView<MainController> {
  var con = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(() => Scaffold(
          body: controller.pages[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              if (value == 3) {
                con.getFavorite();
              }
              controller.changeIndex(value);
            },
            selectedItemColor: ColorManager.redColor,
            currentIndex: controller.currentIndex.value,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            items: controller.tabs
                .map((e) => BottomNavigationBarItem(
                      icon: Icon(
                        e.icon,
                      ),
                      label: e.label.tr,
                    ))
                .toList(),
          ),
        ));
  }
}
