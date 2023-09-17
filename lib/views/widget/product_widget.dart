import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/favorite_controller.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';


class ProductWidget extends StatelessWidget {
  const ProductWidget({
    required this.imageHeight,
    this.favoriteSize = 18,
    super.key,
    required this.productModel,
  });

  final double imageHeight;
  final double favoriteSize;

  final ProductModel productModel;

 
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.productDetailsRoute,
            arguments: productModel);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 20,
                  spreadRadius: 1,
                )
              ],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: imageHeight,
                  width: double.infinity,
                  padding: EdgeInsets.zero,
                  // margin: const EdgeInsets.only(bottom: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Hero(
                    tag: UniqueKey(),
                    child: Image.network(
                      productModel.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  productModel.name,
                  style: StyleManager.headline3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${productModel.price} ر.س',
                  style: StyleManager.smallText(
                    color: ColorManager.redColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          GetBuilder<FavoriteController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: InkWell(
                onTap: () {
                  controller.favorites.any(
                    (element) {
                      return element.id == productModel.id;
                    },
                  )
                      ? controller.deleteFavorite(productModel.id)
                      : controller.addToFavorites(productModel);
                },
                child: CircleAvatar(
                  backgroundColor:
                      Colors.white.withOpacity(0.20000000298023224),
                  radius: favoriteSize,
                  child: Icon(
                      controller.favorites.any(
                        (element) {
                          return element.id == productModel.id;
                        },
                      )
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
