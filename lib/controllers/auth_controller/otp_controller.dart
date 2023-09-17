import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/user_model.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/services/authServices/auth_service.dart';
import 'package:sezon_app/views/widget/loading_widget.dart';


class OtpController extends GetxController {
  late final TextEditingController pinController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  verifyOtp(UserModel userModel) async {
    if (formKey.currentState!.validate()) {
      openLoadingDialog();
      var message =
          await AuthService.instance.verifyCode(otpCode: pinController.text);
      if (message.isEmpty) {
        AuthService.instance.createUser(userModel);
        
        Get.snackbar(
          'Success',
          'Register successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(RouteName.mainRoute);
      } else {
        Get.back();
        Get.snackbar(
          'Failed',
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
