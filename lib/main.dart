import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}



/* import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => HomePage(),
      ),
      GetPage(
        name: '/city',
        page: () => CityPage(),
        binding: CityBinding(),
      ),
    ],
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME')),
      body: Center(
        child:  MaterialButton(
          onPressed: () => Get.toNamed('/city'),
          child: Text('Go to Cities'),
        ),
      ),
    );
  }
}

class CityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityProvider());
    Get.lazyPut(() => CityController(cityProvider: Get.find()));
    // Get.put(CityController(cityProvider: Get.find()));
  }
}

class CityModel {
  CityModel({
    this.id,
    this.sigla,
  });

  String? id;
  String ?sigla;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["sigla"],
        sigla: json["nome"],
      );

  static List<CityModel> listFromJson(list) =>
      List<CityModel>.from(list.map((x) => CityModel.fromJson(x)));
}

class CityController extends GetxController with StateMixin<List<CityModel>> {
  final CityProvider cityProvider;
  CityController({required this.cityProvider});

  @override
  void onInit() {
    findAllCities();
    super.onInit();
  }

  void findAllCities() {
    cityProvider.getCity().then((result) {
      List<CityModel>? data = result.body;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void insertCity() {
    const body = {'id': 'joao', 'sigla': "47"};
    cityProvider.postCity(body).then((result) {
      log(result.body!.id.toString());
      print(result.body?.sigla);
    });
    
  }
}

class CityProvider extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    httpClient.defaultDecoder = CityModel.listFromJson;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
      return request;
    });
  }
  Future<Response<List<CityModel>>> getCity() => get<List<CityModel>>(
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  );

  Future<Response<CityModel>> postCity(body) =>
      post<CityModel>('https://servicodados.ibge.gov.br/api/v1/localidades/estados', body,
          decoder: (obj) => CityModel.fromJson(obj));
}

class CityPage extends GetView<CityController> {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cities')),
      body: Container(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              return Text(state[index].id!);
            },
          ),
          onLoading: Center(child: CircularProgressIndicator()),
          onError: (error) => Center(
            child: Text(
              'Error: $error',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.insertCity(),
      ),
    );
  }
} */