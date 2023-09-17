import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sezon_app/controllers/auth_controller/otp_controller.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/utils/validation_manager.dart';
import 'authComponent/header_text_widget.dart';
import 'authComponent/logo_with_background_widget.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          const LogoWithBackgroundWidget(),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 35),
            children: [
              HeaderTextWidget(
                text: 'verification_code'.tr,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                '${'otp_message'.tr}${Get.arguments.phoneNumber}',
                style: StyleManager.headline2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 27,
              ),
              Form(
                key: controller.formKey,
                child: Pinput(
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsRetrieverApi,
                  controller: controller.pinController,
                  validator: (value) => value!.isValidOtp,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  autofillHints: const [AutofillHints.oneTimeCode],
                  errorPinTheme: PinTheme(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorManager.redColor,
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  length: 6,
                  toolbarEnabled: false,
                  defaultPinTheme: PinTheme(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: ColorManager.grayColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 94,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.verifyOtp(Get.arguments);
                },
                child: Text(
                  'send'.tr,
                  style: StyleManager.smallText(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
            ],
          )
        ],
      ),
    );
  }
}
