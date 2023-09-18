import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/favorite_controller.dart';
import 'package:sezon_app/controllers/home_controllers/details_controller.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/home/homeComponent/label_widget.dart';
import 'package:sezon_app/views/widget/product_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ProductDetailScreen extends GetView<DetailsController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Product_details'.tr,
          style: StyleManager.headline1(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 230,
                  child: PageView.builder(
                    controller: controller.pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Hero(
                      tag: UniqueKey(),
                      child: Image.network(
                        Get.arguments.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    itemCount: 1,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 1,
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 15,
                      activeDotColor: ColorManager.redColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      Get.arguments?.name ?? '',
                      style: StyleManager.headline1(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${Get.arguments?.price ?? ''} ر.س',
                      style: StyleManager.smallText(
                        color: ColorManager.redColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(Get.arguments.details),
                    const SizedBox(
                      height: 30,
                    ),
                     LabelWidget(
                      text: 'related_products'.tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<DetailsController>(
                      init: DetailsController(),
                      builder: (homeController) {
                        return SizedBox(
                          height: 170,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.productsCategory.length,
                            itemBuilder: (context, index) => SizedBox(
                              height: 155,
                              width: 119,
                              child: ProductWidget(
                                imageHeight: 83,
                                favoriteSize: 15,
                                productModel:
                                    homeController.productsCategory[index],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                GetBuilder<FavoriteController>(
                  builder: (favoritesController) => Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          favoritesController.favorites.any(
                            (element) {
                              return element.id == Get.arguments.id;
                            },
                          )
                              ? Get.snackbar("info".tr,
                                  "this_product_already_added_to_the_favorites".tr)
                              : Get.find<FavoriteController>()
                                  .addToFavorites(Get.arguments);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: ColorManager.redColor),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)))),
                        child: Text(
                          'add_to_favorites'.tr,
                          style: StyleManager.smallText(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.redColor),
                        )),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.purchaseCompletionRoute);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5)))),
                    child: Text(
                      'buy_now'.tr,
                      style: StyleManager.smallText(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
