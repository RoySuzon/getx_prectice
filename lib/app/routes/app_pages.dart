import 'package:get/get.dart';
import 'package:getx_prectice/app/modules/Auth/controllers/auth_controller.dart';
import '../modules/Auth/views/sign_up_view.dart';
import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/auth_view.dart';
import '../modules/Auth/views/login_screen.dart';
import '../modules/DetailsScreen/bindings/details_screen_binding.dart';
import '../modules/DetailsScreen/views/details_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const DETAILS_SCREEN = Routes.DETAILS_SCREEN;
  static const LOGIN = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS_SCREEN,
      page: () => const DetailsScreenView(),
      binding: DetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      
    ),
    GetPage(
          name: _Paths.SIGN_UP,
          page: () => const SignUpView(),
          binding: AuthBinding(),
        ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
  ];
}
