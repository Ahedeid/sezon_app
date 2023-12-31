import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/auth_controller/login_controller.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/utils/validation_manager.dart';
import 'package:sezon_app/views/user_role/screens/auth/authComponent/header_text_widget.dart';
import 'package:sezon_app/views/user_role/screens/auth/authComponent/logo_with_background_widget.dart';
import 'package:sezon_app/views/user_role/screens/auth/authComponent/rich_text_widget.dart';
import 'package:sezon_app/views/user_role/widget/cutom_text_field_widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            const LogoWithBackgroundWidget(),
            Form(
              key: controller.formKey,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 35),
                children: [
                  HeaderTextWidget(
                    text: 'login'.tr
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    controller: controller.userNameController,
                    validator: (value) => value!.isValidName,
                    textInputAction: TextInputAction.next,
                    hintText: 'name'.tr,
                    labelText: 'userName'.tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: controller.passwordController,
                    validator: (value) => value!.isValidPassword,
                    textInputAction: TextInputAction.done,
                    hintText: '123451234',
                    labelText: 'password'.tr,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      alignment: Alignment.centerLeft,
                    ),
                    child: Text(
                      'forget_your_password'.tr,
                      textAlign: TextAlign.left,
                      style: StyleManager.labelStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: Text(
                      'login'.tr,
                      style: StyleManager.smallText(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  RichTextWidget(
                    text1: 'don\'t_have_account'.tr,
                    text2: 'new_account'.tr,
                    onTap: () {
                      Get.toNamed(RouteName.registerRoute);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
