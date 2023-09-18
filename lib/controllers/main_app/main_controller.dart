import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/tab_model.dart';
import 'package:sezon_app/views/user_role/screens/home/home_screen.dart';
import 'package:sezon_app/views/user_role/screens/orders/ui/orders_screen.dart';
import 'package:sezon_app/views/user_role/screens/category_screen.dart';
import 'package:sezon_app/views/user_role/screens/favorite_screen.dart';


class MainController extends GetxController {
  var currentIndex = 0.obs;

  changeIndex(int index) {
    debugPrint(currentIndex.value.toString());
    currentIndex.value = index;
  }

  List<TabModel> tabs = [
    TabModel(icon: Icons.home, label: 'home'),
    TabModel(icon: Icons.grid_view, label: 'category'),
    TabModel(icon: Icons.shopping_cart, label: 'orders'),
    TabModel(icon: Icons.favorite, label: 'favorite'),
  ];
  final pages = [
    const HomeScreen(),
    CategoryScreen(),
    const OrdersScreen(),
    FavoriteScreen()
  ];
}
