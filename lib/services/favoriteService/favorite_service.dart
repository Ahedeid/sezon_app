import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';

class FavoriteService {
  static FavoriteService get instance => FavoriteService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<List<ProductModel>, bool>> getAllFavorite() async {
    try {
      var snapshot = await _firestore
          .collection('favorites')
          .where('userId', isEqualTo: sl<SharedPrefController>().getId())
          .get();

      List<ProductModel> favoriteProduct = snapshot.docs
          .map((e) => ProductModel.fromSnapshotForFavorites(e))
          .toList();
      return left(favoriteProduct);
    } on Exception catch (e) {
   
      return right(false);
    }
  }

  Future<bool> addToFavorite(ProductModel productModel) async {
    try {
      await _firestore
          .collection('favorites')
          .add(productModel.toJson(uId: sl<SharedPrefController>().getId()));
      return true;
    }   catch (e) {
      return false;
    }
  }

  Future<bool> deleteFromFavorite(String id) async {
    try {
      await _firestore
          .collection('favorites')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.delete();
              }));
      return true;
    }  catch (e) {
      return false;
    }
  }
}
