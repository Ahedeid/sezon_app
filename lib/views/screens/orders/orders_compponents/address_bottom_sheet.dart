import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/home/homeComponent/label_widget.dart';
import 'package:sezon_app/views/widget/cutom_text_field_widget.dart';

class AddressBottomSheetWidget extends StatelessWidget {
  const AddressBottomSheetWidget({
    super.key,
  });

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
            LabelWidget(text: 'add_a_new_address'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: 'the_UAE'.tr, labelText: 'country'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'region_province_state'.tr, labelText: 'region'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: 'sheikh_zayed'.tr, labelText: 'city'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'Street_house_residential_unit'.tr,
                labelText: 'street'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: '872324', labelText: 'postal_code'.tr),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: '+972592760208', labelText: 'phone_number'.tr),
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
