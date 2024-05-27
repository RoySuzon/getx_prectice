// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prectice/app/modules/home/posts_model.dart';
import 'package:http/http.dart';



class HomeController extends GetxController with StateMixin<List<Posts>> {
  RxInt count = RxInt(0);
  RxList<Posts> datas = RxList();
  RxList<Posts> searchList = RxList();
  final searchController = TextEditingController();
  RxBool isLoading = false.obs;

  search({String query = ""}) => _search(query: query);

  @override
  void onInit() async {
    getPosts();
    super.onInit();
  }

  getPosts() async {
    try {
      isLoading.value = true;
      final res = await get(Uri.parse(
          "https://servicodados.ibge.gov.br/api/v1/localidades/estados"));
      if (res.statusCode == 200) {
        datas.value = postsFromJson(res.body);
      }
    } on Exception catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      search();
    }
  }

  _search({required String query}) {
    searchList.value = datas
        .where((element) =>
            element.sigla!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
