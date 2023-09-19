import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';

class OrderController extends GetxController {
  String groupeValue = 'stripe';

  changePaymentMethod(String? value) {
    groupeValue = value ?? 'stripe';
    update();
  }

  var gPay = const PaymentSheetGooglePay(
    merchantCountryCode: "US",
    currencyCode: "US",
    testEnv: true,
  );

  Future<void> initPaymentSheet() async {
    try {
      final response = await Dio().post(
          'https://us-central1-stripe-checkout-flutter.cloudfunctions.net/stripePaymentIntentRequest',
          data: {
            'email': 'ahedeid2000@gmail.com',
            'amount': '1000',
          });

      final jsonResponse = jsonDecode(response.data);

      await stripe.Stripe.instance.initPaymentSheet(
        paymentSheetParameters: stripe.SetupPaymentSheetParameters(
          customFlow: true,
          merchantDisplayName: sl<SharedPrefController>().getUser().fullName,
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          customerEphemeralKeySecret: "",
          customerId: "",
          setupIntentClientSecret: "",
          googlePay: gPay,
          style: ThemeMode.light,
        ),
      );
    } catch (e) {
      Get.snackbar("Erorr", e.toString());
      rethrow;
    }
  }

  Future<void> _displayPaymentSheet() async {
    try {
      await stripe.Stripe.instance.presentPaymentSheet(
          options: const stripe.PaymentSheetPresentOptions(timeout: 1200000));
      Get.snackbar('', 'Payment successfully completed');
    } catch (e) {
      Get.snackbar("Erorr", e.toString());
    }
  }
}
