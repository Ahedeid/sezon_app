import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/home_controllers/home_controller.dart';
import 'package:sezon_app/views/user_role/screens/home/homeComponent/label_widget.dart';
import 'package:sezon_app/views/user_role/screens/home/homeComponent/search_widget.dart';
import 'package:sezon_app/views/user_role/widget/category_widget.dart';
import 'package:sezon_app/views/user_role/widget/custome_appbar.dart';
import 'package:sezon_app/views/user_role/widget/product_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CustomAppBar(title: 'home'.tr),
      body: GestureDetector(
        onTap: (){
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
             LabelWidget(text: 'category'.tr),
            const SizedBox(
              height: 21,
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return SizedBox(
                  height: 75,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryLoading
                        ? 10
                        : controller.categories.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => controller.categoryLoading
                        ? const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator())
                        : CategoryWidget(
                            category: controller.categories[index].name,
                            onTap: () {},
                            image: controller.categories[index].image,
                          ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 31,
            ),
            LabelWidget(text: 'products'.tr),
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
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 4 / 5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (_, index) => ProductWidget(
                          imageHeight: 135,
                          productModel: homeController.productsList[index],
                        ),
                        itemCount: homeController.productsList.length,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
