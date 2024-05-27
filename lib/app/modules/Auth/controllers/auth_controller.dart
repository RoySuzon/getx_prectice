import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_prectice/local_db.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';

class AuthController extends GetxController {
  // final emailController = TextEditingController();
  // final passController = TextEditingController();

  Box box = Boxes.loginBox;

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool loading = false.obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    email.value = "emilys";
    password.value = "emilyspass";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<bool> login() async {
    try {
      loading.value = true;
      // await Future.delayed(const Duration(seconds: 2));

      final res = await post(Uri.parse("https://dummyjson.com/auth/login"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "username": email.value,
            "password": password.value,
            "expiresInMins": "30"
          }));
      log(res.body);
      if (res.statusCode == 200) {
        await box.put("login", res.body);
        await box.put("isLogin", true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      loading.value = false;
    }
  }

  @override
  void onClose() {
    // emailController.dispose();
    // passController.dispose();
    super.onClose();
  }
}
