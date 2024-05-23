import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreenController extends GetxController {
  final nameController = TextEditingController();
  RxnString name = RxnString();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    log("Dispose");
    super.onClose();
  }
}
