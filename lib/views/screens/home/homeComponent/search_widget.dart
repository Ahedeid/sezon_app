import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/home_controllers/home_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Timer? _debounce;
    return TextFormField(
      onChanged: (val) {
        if (_debounce?.isActive ?? false) {
          _debounce?.cancel();
        }
        _debounce = Timer(
            const Duration(milliseconds: 500), () {
          homeController.searchProduct(text: val);
          print(val.toString());
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'search_world_here'.tr,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
