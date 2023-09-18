import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/tab_model.dart';
import 'package:sezon_app/views/user_role/screens/home/home_screen.dart';
import 'package:sezon_app/views/user_role/screens/notification_screen.dart';
import 'package:sezon_app/views/user_role/screens/orders/ui/orders_screen.dart';
import 'package:sezon_app/views/user_role/screens/profile/profile_screen.dart';


class BNBAdminController extends GetxController {
  var currentIndex = 0.obs;

  changeIndex(int index) {
    debugPrint(currentIndex.value.toString());
    currentIndex.value = index;
  }

  List<TabModel> tabs = [
    TabModel(icon: Icons.home, label: 'home'),
    TabModel(icon: Icons.shopping_cart, label: 'orders'),
    TabModel(icon: Icons.notifications, label: 'notifications'),
    TabModel(icon: Icons.person, label: 'profile'),
  ];
  final pages = [
    const HomeScreen(),
    const OrdersScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];
}
