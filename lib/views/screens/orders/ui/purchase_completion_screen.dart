import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/order_controller.dart';
import 'package:sezon_app/utils/assets_path.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/orders/orders_compponents/address_bottom_sheet.dart';
import 'package:sezon_app/views/screens/orders/orders_compponents/list_tile_purchase_widget.dart';
import 'package:sezon_app/views/screens/orders/orders_compponents/payment_bottom_sheet.dart';
import 'package:sezon_app/views/screens/orders/orders_compponents/product_characteristcs_bottom_sheet.dart';

class PurchaseCompletionScreen extends StatelessWidget {
   PurchaseCompletionScreen({super.key});
   OrderController value = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'complete_your_purchase'.tr,
          style: StyleManager.headline1(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            ListTilePurchaseWidget(
                icon: AssetPath.addressIcon,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const AddressBottomSheetWidget(),
                  );
                },
                title: 'add_address'.tr),
            ListTilePurchaseWidget(
                icon: AssetPath.paymentIcon,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const PaymentMethod(),
                  );
                },
                title: 'choose_a_payment_method'.tr),
            ListTilePurchaseWidget(
                icon: AssetPath.productCharIcon,
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const ProductCharacteristic(),
                  );
                },
                title: 'add_product_specifications'.tr),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'confirmation'.tr,
                style: StyleManager.smallText(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
