import 'package:get/get.dart';
import 'package:sezon_app/controllers/auth_controller/login_binding.dart';
import 'package:sezon_app/controllers/auth_controller/otp_binding.dart';
import 'package:sezon_app/controllers/auth_controller/register_binding.dart';
import 'package:sezon_app/controllers/home_controllers/details_binding.dart';
import 'package:sezon_app/controllers/main_app/main_binding.dart';
import 'package:sezon_app/controllers/profile_controller/profile_binding.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/views/user_role/screens/home/product_details.dart';
import 'package:sezon_app/views/user_role/screens/auth/login_screen.dart';
import 'package:sezon_app/views/user_role/screens/auth/otp_screen.dart';
import 'package:sezon_app/views/user_role/screens/auth/register_screen.dart';
import 'package:sezon_app/views/user_role/screens/main_screen.dart';
import 'package:sezon_app/views/user_role/screens/notification_screen.dart';
import 'package:sezon_app/views/user_role/screens/orders/ui/purchase_completion_screen.dart';
import 'package:sezon_app/views/user_role/screens/profile/profile_screen.dart';
import 'package:sezon_app/views/user_role/screens/splash_screen.dart';


class AppRoute {
  static final routes = <GetPage>[
    GetPage(
        name: RouteName.splashRoute,
        page: () => const SplashScreen(),
    ),
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
    GetPage(
        name: RouteName.profileRoute,
        page: () => const ProfileScreen(),
        binding: ProfileBinding()),
    GetPage(
      name: RouteName.purchaseCompletionRoute,
      page: () => PurchaseCompletionScreen(),
    ) ,
    GetPage(
      name: RouteName.notifications,
      page: () => const NotificationScreen(),
    )
  ];
}
