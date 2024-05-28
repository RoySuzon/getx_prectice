// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prectice/app/modules/home/posts_model.dart';
import 'package:getx_prectice/local_db.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeController extends GetxController {
  RxList<Posts> datas = RxList();
  RxList<Posts> searchList = RxList();

  final searchController = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<LoginModel> loginModel = Rxn<LoginModel>();

  search({String query = ""}) => _search(query: query);

  @override
  void onInit() {
    loginModel.value = loginModelFromJson(Boxes.loginBox.get('login'));
    // getPosts();
    super.onInit();
  }

  updateData() {
    loginModel.value = loginModelFromJson(jsonEncode({
      "id": 1,
      "username": "Goutom",
      "email": "goutomroy770@gmail.com",
      "firstName": "Goutom",
      "lastName": "Roy",
      "gender": "female",
      "image": "https://avatars.githubusercontent.com/u/161811340?s=400&u=24bfd57a8cf585d89cc6cb84c080b6cff4524fa2&v=4",
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTY4NzQyMDcsImV4cCI6MTcxNjg3NjAwN30.eKa3cGzTj2dEbU8t3JPGEt0fhY4jThLdRTu5EJ4JXrU"
    }));
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
}

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  LoginModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
      };
}
