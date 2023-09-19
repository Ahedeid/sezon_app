import 'package:get/get.dart';
import 'package:sezon_app/controllers/add_product_controller/add_product_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }
}
