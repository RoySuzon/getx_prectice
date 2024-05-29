// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prectice/app/modules/home/posts_model.dart';
import 'package:getx_prectice/app/routes/app_pages.dart';
import 'package:getx_prectice/local_db.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeController extends GetxController {
  RxBool active = false.obs;
  RxList<Posts> datas = RxList();

  RxList<LoginModel> userList = RxList<LoginModel>();
  RxList<Posts> searchList = RxList();

  final searchController = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<LoginModel> loginModel = Rxn<LoginModel>();

  search({String query = ""}) => _search(query: query);

  @override
  void onInit() {
    putData();
    // getPosts();
    super.onInit();
  }

  putData() {
    active.value = !active.value;
    loginModel.value = loginModelFromJson(Boxes.loginBox.get('login'));

    for (var element in userData) {
      userList.add(loginModelFromJson(jsonEncode(element)));
    }
  }

  updateData() {
    var ran = math.Random();
    active.value = !active.value;
    loginModel.value = userList[ran.nextInt(userList.length - 1)];
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

  Future<void> logOut() async {
    await Boxes.loginBox.clear();
    Get.offNamed(Routes.LOGIN);
  }
}

List<Map> userData = [
  {
    "id": 0,
    "username": "Goutom",
    "email": "goutomroy770@gmail.com",
    "firstName": "Goutom",
    "lastName": "Roy",
    "gender": "MALE",
    "image":
        "https://avatars.githubusercontent.com/u/161811340?s=400&u=24bfd57a8cf585d89cc6cb84c080b6cff4524fa2&v=4",
    "token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTY4NzQyMDcsImV4cCI6MTcxNjg3NjAwN30.eKa3cGzTj2dEbU8t3JPGEt0fhY4jThLdRTu5EJ4JXrU"
  },
  {
    "id": 1,
    "username": "Mr",
    "email": "goutomroy770@gmail.com",
    "firstName": "MR",
    "lastName": "Roy",
    "gender": "MALE",
    "image":
        "https://avatars.githubusercontent.com/u/161811340?s=400&u=24bfd57a8cf585d89cc6cb84c080b6cff4524fa2&v=4",
    "token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTY4NzQyMDcsImV4cCI6MTcxNjg3NjAwN30.eKa3cGzTj2dEbU8t3JPGEt0fhY4jThLdRTu5EJ4JXrU"
  },
  {
    "id": 2,
    "username": "SS",
    "email": "goutomroy770@gmail.com",
    "firstName": "SS",
    "lastName": "Roy",
    "gender": "male",
    "image":
        "https://avatars.githubusercontent.com/u/161811340?s=400&u=24bfd57a8cf585d89cc6cb84c080b6cff4524fa2&v=4",
    "token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTY4NzQyMDcsImV4cCI6MTcxNjg3NjAwN30.eKa3cGzTj2dEbU8t3JPGEt0fhY4jThLdRTu5EJ4JXrU"
  },
  {
    "id": 3,
    "username": "Ratan",
    "email": "goutomroy770@gmail.com",
    "firstName": "Ratan",
    "lastName": "Roy",
    "gender": "MALE",
    "image":
        "https://avatars.githubusercontent.com/u/161811340?s=400&u=24bfd57a8cf585d89cc6cb84c080b6cff4524fa2&v=4",
    "token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTY4NzQyMDcsImV4cCI6MTcxNjg3NjAwN30.eKa3cGzTj2dEbU8t3JPGEt0fhY4jThLdRTu5EJ4JXrU"
  },
  {
    "id": 4,
    "username": "Suzon",
    "email": "goutomroy770@gmail.com",
    "firstName": "Suzon",
    "lastName": "Roy",
    "gender": "MALE",
    "image":
        "https://avatars.githubusercontent.com/u/161811340?s=400&u=24bfd57a8cf585d89cc6cb84c080b6cff4524fa2&v=4",
    "token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTY4NzQyMDcsImV4cCI6MTcxNjg3NjAwN30.eKa3cGzTj2dEbU8t3JPGEt0fhY4jThLdRTu5EJ4JXrU"
  },
];

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
