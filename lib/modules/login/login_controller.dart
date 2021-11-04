import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:urbansat/modules/home/home_controller.dart';
import 'package:urbansat/modules/vehicles/vehicles_controller.dart';
import 'package:shared_preferences/shared_preferences.Dart';

class LoginController extends GetxController {
  final RxString _token = RxString('');
  final RxString _username = RxString('');
  final RxString _userimage = RxString('');

  set token(RxString value) => _token.value = value.toString();
  set username(RxString value) => _username.value = value.toString();
  set userimage(RxString value) => _userimage.value = value.toString();

  RxString get token => this._token;
  RxString get username => this._username;
  RxString get userimage => this._userimage;

  void checkLogin({required String user, required String password}) async {
    var baseUrl = 'http://plataforma.urbansat.com.br/api_v2/?m=login';

    final response = await http.post(Uri.parse(baseUrl), body: {
      'txtUserName': user,
      'txtPassword': password,
    }).then((resp) => resp);

    var json;
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);

      if (json['success'] == true) {
        token.value = json['token'];
        username.value = json['complete_name'];
        userimage.value = json['logo'];

        final controllerVehicles = Get.put(VehiclesController());
        final controllerHome = Get.put(HomeController());

        /* BUSCA TODOS OS VEÍCULOS DESSE USUÁRIO */
        await controllerVehicles.getVehicles();
        /* BUSCA DADOS DA HOME */
        await controllerHome.getDashboards();
        /* REDIRECIONA PARA A PAGE VEHICLES */
        await Get.toNamed('/vehicles');
      } else {
        Get.snackbar(
          'Falha',
          json['error'],
          duration: Duration(
            seconds: 3,
          ),
          backgroundColor: Colors.red[400],
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Falha do Servidor',
        'Entre em contato com o suporte',
        duration: Duration(
          seconds: 3,
        ),
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
      );
    }
  }
}
