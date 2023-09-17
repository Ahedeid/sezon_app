import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String details;
  final String image;
  final String name;
  final String price;
  final String id;
  final String? category;
  final String? userId;
  final bool? isFavorite;

  ProductModel(
      {required this.category,
      required this.details,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      this.userId,
      this.isFavorite});

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
        category: data['category'] ?? '',
        details: data['details'],
        id: document.id,
        image: data['image'],
        name: data['name'],
        price: data['price'],
        userId: data['userId'] ?? '',
        isFavorite: data['isFavorite'] ?? false);
  }

  factory ProductModel.fromSnapshotForFavorites(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
        category: data['category'] ?? '',
        details: data['details'],
        id: data['id'],
        image: data['image'],
        name: data['name'],
        price: data['price'],
        userId: data['userId'] ?? '',
        isFavorite: data['isFavorite'] ?? false);
  }

  Map<String, dynamic> toJson({required String uId}) => {
        "details": details,
        "image": image,
        "name": name,
        "price": price,
        "userId": uId,
        "id": id,
        "isFavorite": isFavorite ?? false
      };

  @override
  String toString() {
    return 'ProductModel(details: $details, image: $image, name: $name, price: $price, id: $id, category: $category, userId: $userId)';
  }

  @override
  List<Object?> get props => [id];
}
