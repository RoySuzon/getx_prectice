import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    //  print('object');
    return GetBuilder<HomeController>(builder: (context) {
      return Scaffold(
        drawer: Drawer(
          width: const Size.fromWidth(200).width,
          child: Scaffold(
            body: Center(
              child: MaterialButton(
                color: Colors.blueGrey,
                onPressed: () async => await controller.logOut(),
                splashColor: Colors.blueGrey,
                child: const Text(
                  'LogOut',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // controller.active.isTrue
            //     ? controller.updateData()
            //     : controller.putData();
            controller.updateData();
          },
          child: const Icon(Icons.sync),
        ),
        appBar: AppBar(
          title: Text("About ${controller.loginModel.value!.username}"),
          centerTitle: true,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => controller.increment(),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // CupertinoTextField(
              //   onTapOutside: (event) => FocusNode().unfocus(),
              //   // suffix: Icon(Icons.snapchat),
              //   clearButtonMode: OverlayVisibilityMode.editing,
              //   // controller: controller.searchController,
              //   onChanged: (value) => controller.search(query: value),
              // ),
              const SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 50,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Obx(() => ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: CachedNetworkImage(
                          imageUrl: controller.loginModel.value!.image!,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => Text(
                    "${controller.loginModel.value!.firstName!} ${controller.loginModel.value?.lastName!}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(height: 10),
              Text(
                'Software Developer',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Obx(() => Text(controller.loginModel.value!.email!)),
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('+1 123 456 7890'),
              ),
              const ListTile(
                leading: Icon(Icons.location_city),
                title: Text('Location'),
                subtitle: Text('New York, USA'),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Vestibulum in neque et nisl.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
