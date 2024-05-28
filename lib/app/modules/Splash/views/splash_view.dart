import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashPageController>(
      builder: (controller) {
        return const Scaffold(
          body: Center(
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          ),
        );
      },
    );
  }
}
