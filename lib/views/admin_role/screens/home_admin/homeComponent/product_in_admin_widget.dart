import 'package:flutter/material.dart';
import 'package:sezon_app/models/products_model.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';

class ProductInAdmin extends StatelessWidget {
  const ProductInAdmin({required this.productModel, super.key});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
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
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name,
                  style: StyleManager.headline3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  productModel.details,
                  maxLines: 2,
                  style: StyleManager.labelStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${productModel.price}ر.س ',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.redColor,
                      ),
                    ),
                    const Text(
                      'عمليات الشراء : 10',
                      style: StyleManager.labelStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
