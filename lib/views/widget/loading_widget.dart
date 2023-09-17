import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_manager.dart';

void openLoadingDialog() async {
  if (Get.isSnackbarOpen) {
    Get.back();
  }
  if (Get.isDialogOpen!) return;
  await Get.dialog(
    Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: const CircularProgressIndicator(
          color: ColorManager.redColor,
        )),
    barrierDismissible: false,
  );
}
