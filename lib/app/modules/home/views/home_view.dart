import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_prectice/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
      ),
      body: Center(
        child: Obx(() => Column(
              children: [
                CupertinoTextField(
                  onTapOutside: (event) => FocusNode().unfocus(),
                  // suffix: Icon(Icons.snapchat),
                  clearButtonMode: OverlayVisibilityMode.editing,
                  // controller: controller.searchController,
                  onChanged: (value) => controller.search(query: value),
                ),
                Text(
                  controller.count.value.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.searchList.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () => Get.toNamed(AppPages.DETAILS_SCREEN,
                                arguments: controller.searchList[index]),
                            title: Text(
                                controller.searchList[index].sigla.toString()),
                          ),
                        ),
                )
              ],
            )),
      ),
    );
  }
}
