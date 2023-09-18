import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/category_controller.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/views/widget/category_widget.dart';
import 'package:sezon_app/views/widget/custome_appbar.dart';
import 'package:sezon_app/views/widget/product_widget.dart';

class CategoryScreen extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'category'),
        body: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (categoryController) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 90,
                child: Container(
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ]),
                  child: ListView.separated(
                    itemBuilder: (context, index) => categoryController.loading
                        ? Container(
                            color: Colors.grey,
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: const CircularProgressIndicator(),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              CategoryWidget(
                                image:
                                    categoryController.categories[index].image,
                                category:
                                    categoryController.categories[index].name,
                                onTap: () {
                                  categoryController.changedIndex(index);
                                  categoryController.getProductsCategory(
                                      categoryId: categoryController
                                          .categories[index].id);
                                },
                              ),
                              Container(
                                width: 5,
                                height: 80,
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    color: categoryController.selectedIndex ==
                                            index
                                        ? ColorManager.redColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 25,
                    ),
                    itemCount: categoryController.categories.length,
                  ),
                ),
              ),
              Expanded(
                child: categoryController.categoryLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        color: Colors.white,
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                            left: 22,
                            right: 22,
                            top: 22,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.67,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (_, index) => ProductWidget(
                            imageHeight: 83,
                            favoriteSize: 15,
                            productModel:
                                categoryController.productsCategory[index],
                          ),
                          itemCount: categoryController.productsCategory.length,
                        ),
                      ),
              )
            ],
          ),
        ));
  }
}
