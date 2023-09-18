import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:sezon_app/models/user_model.dart';
import 'package:sezon_app/services/profileService/profile_service.dart';

class ProfileController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Rx<Uint8List?> image = Rx<Uint8List?>(null);
  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final imageUrl = ''.obs;
  final loading = false.obs;
  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  editProfile() async {
    if (formKey.currentState!.validate()) {
      Get.back();
      loading.value = true;
      var result = await ProfileService.instance.editUserInfo(
        UserModel(
            fullName: userNameController.text,
            password: passwordController.text,
            phoneNumber: phoneController.text),
      );

      if (result == true) {
        user.value = user.value!.copyWith(
          fullName: userNameController.text,
          password: passwordController.text,
          phoneNumber: phoneController.text,
        );
        Get.snackbar('Success', 'Edited Successfully');
        loading.value = false;
      }

      loading.value = false;
    }
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
  }

  selectImage() async {
    Uint8List _image = await pickImage(ImageSource.gallery);
    image.value = _image;
    String resp = await ProfileService.instance.saveData(file: image.value!);
    if (resp == 'error') {
      Get.snackbar('Error', 'something went wrong try agin');
    } else {
      imageUrl.value = resp;
      user.value = user.value!.copyWith(imageLink: resp);
      Get.snackbar('success', 'image updated successfully');
    }
  }

  getUserDetails() async {
    loading.value = true;
    user.value = await ProfileService.instance.getUserDetails();
    userNameController.setText(user.value?.fullName ?? '');
    phoneController.setText(user.value?.phoneNumber ?? '');
    passwordController.setText(user.value?.password ?? '');
    loading.value = false;
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }
}
