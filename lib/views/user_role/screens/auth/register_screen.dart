import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/auth_controller/register_controller.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/utils/validation_manager.dart';
import 'package:sezon_app/views/user_role/widget/cutom_text_field_widget.dart';
import 'authComponent/header_text_widget.dart';
import 'authComponent/logo_with_background_widget.dart';
import 'authComponent/rich_text_widget.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

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
                    text: 'create_new_account'.tr,
                  ),
                  const SizedBox(
                    height: 40,
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
                    controller: controller.phoneController,
                    validator: (value) => value!.isValidPhone,
                    textInputAction: TextInputAction.next,
                    hintText: '+972592760208',
                    labelText: 'phone_number'.tr,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: controller.passwordController,
                    validator: (value) => value!.isValidPassword,
                    textInputAction: TextInputAction.next,
                    hintText: '123451234',
                    labelText: 'password'.tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    validator: (value) => controller.validatePasswordMath(value),
                    textInputAction: TextInputAction.done,
                    hintText: '123451234',
                    labelText: 'password_confirmation'.tr,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.register();
                    },
                    child: Text(
                      'register_account'.tr,
                      style: StyleManager.smallText(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  RichTextWidget(
                    text1: 'have_account'.tr,
                    text2: 'login'.tr,
                    onTap: () {
                      Get.toNamed(RouteName.loginRoute);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
