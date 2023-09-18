import 'package:get/get.dart';

class OrderController extends GetxController {
  String groupeValue = 'stripe';

  changePaymentMethod(String? value) {
    groupeValue = value ?? 'stripe';
    update();
  }
}
