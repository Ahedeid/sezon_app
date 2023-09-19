import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/authServices/auth_service.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:sezon_app/views/user_role/widget/loading_widget.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    if (formKey.currentState!.validate()) {
      openLoadingDialog();
      var value = await AuthService.instance.login(
          password: passwordController.text, userName: userNameController.text);
      if (value) {
        Get.snackbar(
          'Success',
          'Logged in successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(sl<SharedPrefController>().getUser().role == 0
            ? RouteName.mainRoute
            : RouteName.bnbAdmin);
      } else {
        if (Get.isDialogOpen!) Get.back();
        Get.snackbar(
          'Failed',
          'Incorrect login input',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
