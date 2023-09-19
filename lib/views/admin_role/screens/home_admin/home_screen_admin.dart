import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/home_controllers/home_controller.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/views/admin_role/screens/home_admin/homeComponent/product_in_admin_widget.dart';
import 'package:sezon_app/views/user_role/screens/home/homeComponent/search_widget.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('home'.tr)),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          children: [
            const SearchWidget(),
            const SizedBox(
              height: 31,
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (homeController) {
                return homeController.productsLoading
                    ? const Align(
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator()),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => ProductInAdmin(
                          productModel: homeController.productsList[index],
                        ),
                        itemCount: homeController.productsList.length,
                      );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.redColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(RouteName.addProducts);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
