import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool loading = false.obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future login() async {
    try {
      loading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      
      return;
    } catch (e) {
      log(e.toString());
    } finally {
      loading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
