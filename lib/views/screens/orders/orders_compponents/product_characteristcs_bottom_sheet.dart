import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/home/homeComponent/label_widget.dart';
import 'package:sezon_app/views/widget/cutom_text_field_widget.dart';

class ProductCharacteristic extends StatelessWidget {
  const ProductCharacteristic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 26,
          right: 26,
          top: 30,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: 7,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: Get.size.height / 30,
            ),
            LabelWidget(text: 'add_product_specifications'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'example_handmade_colorful_ceramics'.tr,
                labelText: 'product_name'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'example_5_pieces'.tr, labelText: 'quantity'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'example_black'.tr, labelText: 'product_color'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'example_xxl'.tr, labelText: 'the_size'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text('save'.tr,
                    style: StyleManager.smallText(
                        fontWeight: FontWeight.bold, color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
