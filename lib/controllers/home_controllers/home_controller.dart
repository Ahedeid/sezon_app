import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sezon_app/models/categoy_model.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/services/homeServices/homeServices.dart';


class HomeController extends GetxController {
  List<CategoryModel> categories = [];
  List<ProductModel> productsCategory = [];

  bool categoryLoading = false;
  bool productsLoading = false;

  getCategories() async {
    categoryLoading = true;
    update();
    categories = await HomeService.instance.getCategories();
    update();
    categoryLoading = false;
    update();
  }

  List<ProductModel> allProducts = [];
  getAllProducts() async {
    productsLoading = true;
    update();
    allProducts = await HomeService.instance.getAllProducts();

    update();
    productsLoading = false;
    update();
  }

  @override
  void onInit() {
    getCategories();
    getAllProducts();
    super.onInit();
  }

  getRelatedProducts({required String categoryId}) async {
    update();
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
    update();
  }
}
