// class FavoriteModel{

//   final String details;
//   final String image;
//   final String name;
//   final String price;
//    final String userId;


//   FavoriteModel({
//     required this.details,
//     required this.userId,
//     required this.image,
//     required this.name,
//     required this.price,
//   });


//     factory FavoriteModel.fromSnapshot(
//       FavoriteModel<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return FavoriteModel(
//       category: data['category'],
//       details: data['details'],
//       id: document.id,
//       image: data['image'],
//       name: data['name'],
//       price: data['price'],
//     );
//   } 
// }