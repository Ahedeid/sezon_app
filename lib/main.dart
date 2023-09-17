import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sezon_app/firebase_options.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/router/router.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/authServices/auth_service.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:sezon_app/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthService());
  });
  await init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const SezonApp());
}

class SezonApp extends StatelessWidget {
  const SezonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sezon App',
      theme: ThemeManager.theme,
      initialRoute: sl<SharedPrefController>().getLoggedIn()
          ? RouteName.mainRoute
          : RouteName.loginRoute,
      getPages: AppRoute.routes,
    );
  }
}
