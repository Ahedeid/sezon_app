import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/views/user_role/widget/loading_widget.dart';

class AddProductController extends GetxController {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var id = DateTime.now().millisecondsSinceEpoch;

  Future<void> addProduct() async {
    try {
      openLoadingDialog();
      await sl<FirebaseFirestore>()
          .collection('products')
          .doc(id.toString())
          .set({
        'category': 'lfhNROoNYrnjZm5CRZI0',
        'details': productDescriptionController.text,
        'image':
            'https://firebasestorage.googleapis.com/v0/b/sezon-app-41811.appspot.com/o/rasm3lakhshab.png?alt=media&token=1bcfd738-86ae-4526-ad5e-79b32ece54a6',
        'name': productNameController.text,
        'price': priceController.text,
      });
      if (Get.isDialogOpen!) Get.back();
      Get.back();
      Get.snackbar(
        'Success',
        'Add Product done',
      );
    } on FirebaseException catch (e) {
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
