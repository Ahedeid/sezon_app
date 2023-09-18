import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/order_controller.dart';
import 'package:sezon_app/utils/assets_path.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/home/homeComponent/label_widget.dart';
import 'package:sezon_app/views/screens/orders/orders_compponents/payment_details_bottom_sheet.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26,
        right: 26,
        top: 30,
      ),
      child: GetBuilder<OrderController>(
        builder: (controller) => Column(
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
            const LabelWidget(text: 'اختر طريقة الدفع'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            RadioListTile(
              value: 'stripe',
              contentPadding: EdgeInsets.zero,
              activeColor: ColorManager.redColor,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: controller.groupeValue,
              title: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 40,
                    child: SvgPicture.asset(
                      AssetPath.stripe,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('بطاقة stripe'),
                ],
              ),
              onChanged: (value) {
                controller.changePaymentMethod(value);
              },
            ),
            const Divider(),
            RadioListTile(
              value: 'visa',
              contentPadding: EdgeInsets.zero,
              activeColor: ColorManager.redColor,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: controller.groupeValue,
              title: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 45,
                    child: SvgPicture.asset(
                      AssetPath.visa,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('بطاقة الفيزا'),
                ],
              ),
              onChanged: (value) {
                controller.changePaymentMethod(value);
              },
            ),
            SizedBox(
              height: Get.size.height / 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const PaymentMethodDetails(),
                );
              },
              child: Text(
                'التالي',
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
