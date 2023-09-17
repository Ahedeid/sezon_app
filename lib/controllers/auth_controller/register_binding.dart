import 'package:get/get.dart';
import 'package:sezon_app/controllers/auth_controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
