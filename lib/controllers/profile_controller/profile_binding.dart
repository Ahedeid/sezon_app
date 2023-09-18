import 'package:get/get.dart';
import 'package:sezon_app/controllers/profile_controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
