import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/user_model.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/services/authServices/auth_service.dart';
import 'package:sezon_app/views/widget/loading_widget.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validatePasswordMath(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (value != passwordController.text) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

// ----------------------------- Register ----------------------------------

  register() async {
    if (formKey.currentState!.validate()) {
      openLoadingDialog();
      String response = await AuthService.instance
          .phoneVerification(phoneNumber: phoneController.text);
      if (response.isEmpty) {
        if (Get.isDialogOpen!) Get.back();
        Get.snackbar(
          'Success',
          'code sent successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.toNamed(RouteName.otpRoute,
            arguments: UserModel(
                fullName: userNameController.text,
                password: passwordController.text,
                phoneNumber: phoneController.text));
      } else {
        if (Get.isDialogOpen!) Get.back();
        Get.snackbar(
          'Failed',
          response,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
