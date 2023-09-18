import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:sezon_app/utils/assets_path.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(sl<SharedPrefController>().getLoggedIn()
          ? RouteName.mainRoute
          : RouteName.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade900,
      body: Stack(
        children: [
          Image.asset(
            AssetPath.splashBackground,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 300,
            alignment: Alignment.topCenter,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AssetPath.logo,
            ),
          ),
        ],
      ),
    );
  }
}
