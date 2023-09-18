import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController{
  void changeLang(String lang){
    Locale locale = Locale(lang);
    Get.updateLocale(locale);
  }
}