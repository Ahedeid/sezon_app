import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/add_product_controller/add_product_controller.dart';
import 'package:sezon_app/views/admin_role/widgets/label_widget.dart';
import 'package:sezon_app/views/user_role/widget/cutom_text_field_widget.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(title: Text('add_product'.tr),centerTitle: true,),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
          children: [
            LabelWidget(
              text: 'add_new_product'.tr,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: controller.productNameController,
              textInputAction: TextInputAction.next,
              hintText: 'handmade_colorful_ceramics'.tr,
              labelText: 'product_name'.tr,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: controller.productDescriptionController,
              maxLines: 3,
              minLines: 3,
              textInputAction: TextInputAction.next,
              hintText: 'example__product_that_was_made'.tr,
              labelText: 'product_description'.tr,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: controller.priceController,
              textInputAction: TextInputAction.done,
              hintText: '130 رس',
              labelText: 'price'.tr,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              readOnly: true,
              hintText: 'attach_a_picture'.tr,
              labelText: 'add_a_product_image'.tr,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              readOnly: true,
              hintText: 'accessories'.tr,
              labelText: 'select_product_category'.tr,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          onPressed: () {
            controller.addProduct();
          },
          child: Text(
            'add'.tr,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
