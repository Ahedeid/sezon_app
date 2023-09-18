import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/orders/ui/completed_orders_screen.dart';
import 'package:sezon_app/views/screens/orders/ui/on_progress_orders_screen.dart';
import 'package:sezon_app/views/widget/custome_appbar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 100,
          title: 'orders'.tr,
          bottom:  TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: ColorManager.redColor,
            labelStyle: StyleManager.headline2,
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'requests_in_progress'.tr,
              ),
              Tab(
                text: 'requests_received'.tr,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OnProgressOrders(),
            CompletedOrders(),
          ],
        ),
      ),
    );
  }
}
