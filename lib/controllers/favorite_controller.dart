import 'package:get/get.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/services/favoriteService/favorite_service.dart';


class FavoriteController extends GetxController {
  List<ProductModel> favorites = [];
  bool loading = false;
  @override
  void onInit() {
    super.onInit();

    getFavorite();
  }

  getFavorite() async {
    loading = true;
    update();
    final data = await FavoriteService.instance.getAllFavorite();

    data.fold((l) {
      favorites = l;
      loading = false;
      update();
    }, (r) {
      loading = false;
      update();
      Get.snackbar("Error", 'Something went wrong');
    });
  }

  deleteFavorite(String id) async {
    favorites.removeWhere((element) => element.id == id);
    update();
    final data = await FavoriteService.instance.deleteFromFavorite(id);
    Get.snackbar("Success", 'Deleted from the favorites successfully');
    if (data == false) {
      Get.snackbar("Error", 'Something went wrong, try again');
    }
  }

  addToFavorites(ProductModel productModel) async {
    favorites.add(productModel);
    update();
    final data = await FavoriteService.instance.addToFavorite(productModel);
    if (data) {
      Get.snackbar("Success", 'Added to the favorites successfully');
    } else {
      Get.snackbar("Error", 'Something went wrong, try again');
    }
  }
}
