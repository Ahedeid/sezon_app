import 'package:flutter/material.dart';
import 'package:sezon_app/utils/style_manager.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.category,
    required this.image,
    required this.onTap,
    super.key,
  });
  final String category;
  final String image;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 55,
            width: 55,
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            category,
            style: StyleManager.smallText(color: Colors.black),
          )
        ],
      ),
    );
  }
}
