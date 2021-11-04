import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:urbansat/models/home/home_model.dart';
import 'package:urbansat/modules/login/login_controller.dart';

class HomeController extends GetxController {
  final List<HomeModel> _dahsboard = RxList<HomeModel>();

  List<HomeModel> get dahsboard => this._dahsboard;
  set dahsboard(List<HomeModel> dashboard) => dashboard;

  final login = Get.put(LoginController());

  getDashboards() async {
    var baseUrl = 'http://plataforma.urbansat.com.br/api_v2/?m=dashboardRpt';

    final response = await http.post(Uri.parse(baseUrl), body: {
      'txtToken': login.token.toString(),
    });

    var json;
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      // print(json);

      var resp = HomeModel.fromMap(json['aData']);
      // print('resp: $resp');
      dahsboard.assign(resp);
      // print(dahsboard);
    }
  }
}
