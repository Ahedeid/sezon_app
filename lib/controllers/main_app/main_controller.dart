import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/tab_model.dart';
import 'package:sezon_app/views/favorite/favorite_screen.dart';
import 'package:sezon_app/views/home/home_screen.dart';


class MainController extends GetxController {
  var currentIndex = 0.obs;

  changeIndex(int index) {
    print(currentIndex.value);
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
    // CategoryScreen(),
    // const OrdersScreen(),
    FavoriteScreen()
  ];
}
