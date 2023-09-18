import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/profile_controller/profile_controller.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/utils/validation_manager.dart';
import 'package:sezon_app/views/screens/home/homeComponent/label_widget.dart';
import 'package:sezon_app/views/widget/cutom_text_field_widget.dart';


class ProfileBottomSheet extends GetView<ProfileController> {
  const ProfileBottomSheet({
    // required this.userModel,
    super.key,
  });
  // final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LabelWidget(text: 'تعديل الملف الشخصي'),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: controller.userNameController,
              validator: (value) => value!.isValidName,
              hintText: 'name'.tr,
              labelText: 'userName'.tr,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: controller.phoneController,
              validator: (value) => value!.isValidPhone,
              hintText: '+972592663280',
              labelText: 'phone_number'.tr,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: controller.passwordController,
              validator: (value) => value!.isValidPassword,
              hintText: '123456789',
              labelText: 'password'.tr,
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                controller.editProfile();
              },
              child: Text(
                'حفظ',
                style: StyleManager.smallText(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
