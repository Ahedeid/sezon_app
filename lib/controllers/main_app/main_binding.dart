import 'package:get/get.dart';
import 'package:sezon_app/controllers/main_app/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
