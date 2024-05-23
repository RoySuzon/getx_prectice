import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_prectice/app/modules/home/posts_model.dart';

import '../controllers/details_screen_controller.dart';

class DetailsScreenView extends GetView<DetailsScreenController> {
  const DetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Posts posts = Get.arguments;
    controller.nameController.text = posts.nome!;
    controller.name.value = posts.nome;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.name.value!)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            CupertinoTextField(
              onChanged: (value) =>
                  controller.name.value = controller.nameController.text,
              controller: controller.nameController,
            ),
            Obx(() => Text(
                  controller.name.toString(),
                  style: const TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
