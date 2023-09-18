import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/home/homeComponent/label_widget.dart';

class PaymentMethodDetails extends StatelessWidget {
  const PaymentMethodDetails({super.key});

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
            const LabelWidget(text: 'بيانات البطاقة'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'حفظ',
                style: StyleManager.smallText(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
