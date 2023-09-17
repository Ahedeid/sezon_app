import 'package:get/get.dart';
import 'package:sezon_app/controllers/home_controllers/details_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }
}
