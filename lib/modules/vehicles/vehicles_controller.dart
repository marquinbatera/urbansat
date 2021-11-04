import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:urbansat/models/vehicles/vehicles_model.dart';
import 'package:urbansat/modules/login/login_controller.dart';

class VehiclesController extends GetxController {
  final List<VehiclesModel> _vehicles = RxList<VehiclesModel>();
  final List<VehiclesModel> _vehiclesList = RxList<VehiclesModel>();

  List<VehiclesModel> get vehicles => this._vehicles;
  set vehicles(List<VehiclesModel> vehicle) => vehicle;

  List<VehiclesModel> get vehiclesList => this._vehiclesList;
  set vehiclesList(List<VehiclesModel> vehicleList) => vehiclesList;

  final login = Get.put(LoginController());

  void onChange({required String placa}) {
    var dados =
        vehicles.where((element) => element.placa!.startsWith(placa)).toList();

    vehiclesList.assignAll(dados);
  }

  getVehicles() async {
    var baseUrl = 'http://plataforma.urbansat.com.br/api_v2/?m=vehicles&page=1';

    final response = await http.post(Uri.parse(baseUrl), body: {
      'txtToken': login.token.toString(),
    });

    var json;
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      // print(json);
      var resp = json['aData']
          .map<VehiclesModel>((vehicles) =>
              VehiclesModel.fromMap(vehicles as Map<String, dynamic>))
          .toList();

      // vehicles.addAll(resp);
      vehicles.assignAll(resp);
      vehiclesList.assignAll(resp);
      // print(vehicles);
    }
  }
}
