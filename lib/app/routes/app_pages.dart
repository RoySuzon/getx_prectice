import 'package:get/get.dart';

import '../modules/DetailsScreen/bindings/details_screen_binding.dart';
import '../modules/DetailsScreen/views/details_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const DETAILS_SCREEN = Routes.DETAILS_SCREEN;

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
  ];
}
