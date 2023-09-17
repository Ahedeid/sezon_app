import 'package:get/get.dart';
import 'package:sezon_app/controllers/auth_controller/login_binding.dart';
import 'package:sezon_app/controllers/auth_controller/otp_binding.dart';
import 'package:sezon_app/controllers/auth_controller/register_binding.dart';
import 'package:sezon_app/controllers/home_controllers/details_binding.dart';
import 'package:sezon_app/controllers/main_app/main_binding.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/views/auth/login_screen.dart';
import 'package:sezon_app/views/auth/otp_screen.dart';
import 'package:sezon_app/views/auth/register_screen.dart';
import 'package:sezon_app/views/home/product_details.dart';
import 'package:sezon_app/views/mainApp/main_screen.dart';

class AppRoute {
  static final routes = <GetPage>[
    GetPage(
        name: RouteName.loginRoute,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: RouteName.registerRoute,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: RouteName.otpRoute,
        page: () => const OtpScreen(),
        binding: OtpBinding()),
    GetPage(
        name: RouteName.mainRoute,
        page: () => MainScreen(),
        binding: MainBinding()),
    GetPage(
        name: RouteName.productDetailsRoute,
        page: () => const ProductDetailScreen(),
        binding: DetailBinding()),
    // GetPage(
    //     name: RouteName.profileRoute,
    //     page: () => const ProfileScreen(),
    //     binding: ProfileBinding()),
    // GetPage(
    //   name: RouteName.purchaseCompletionRoute,
    //   page: () => PurchaseCompletionScreen(),
    // )
  ];
}
