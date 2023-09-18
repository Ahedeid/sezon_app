import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sezon_app/models/categoy_model.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/service_locator.dart';

class HomeService {
  static HomeService get instance => HomeService();

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await sl<FirebaseFirestore>().collection('category').get();

    if (snapshot.docs.isNotEmpty) {
      List<CategoryModel> categories =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return categories;
    }
    return [];
  }

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await sl<FirebaseFirestore>().collection('products').get();

    if (snapshot.docs.isNotEmpty) {
      List<ProductModel> products =
          snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;
    }
    return [];
  }
}
