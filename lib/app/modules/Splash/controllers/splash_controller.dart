import 'package:get/get.dart';
import 'package:getx_prectice/app/routes/app_pages.dart';
import 'package:getx_prectice/local_db.dart';

class SplashPageController extends GetxController {
  RxString isLoged = "".obs;
  @override
  void onInit() async {
    isLoged.value = Boxes.loginBox.get("isLogin").toString();
    await isLogin();
    super.onInit();
  }

  Future isLogin() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (isLoged.value == 'true') {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }
}
