import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sezon_app/models/categoy_model.dart';
import 'package:sezon_app/models/products_model.dart';

class HomeService {
  static HomeService get instance => HomeService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _firestore.collection('category').get();

    if (snapshot.docs.isNotEmpty) {
      List<CategoryModel> categories =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return categories;
    }
    return [];
  }

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await _firestore.collection('products').get();

    if (snapshot.docs.isNotEmpty) {
      List<ProductModel> products =
          snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;
    }
    return [];
  }
}
