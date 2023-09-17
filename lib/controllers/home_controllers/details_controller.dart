import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/categoy_model.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/services/homeServices/homeServices.dart';


class DetailsController extends GetxController {
  List<CategoryModel> categories = [];
  List<ProductModel> productsCategory = [];
  PageController pageController = PageController();
  bool loading = false;

  @override
  void onInit() {
    getRelatedProducts(categoryId: Get.arguments.category);
    super.onInit();
  }

  getRelatedProducts({required String categoryId}) async {
    List<ProductModel> newProductsList = [];
    List<ProductModel> data = await HomeService.instance.getAllProducts();
    for (ProductModel item in data) {
      if (categoryId == item.category) {
        newProductsList.add(item);
        update();
      }
    }
    productsCategory = newProductsList;
    update();
  }


}
