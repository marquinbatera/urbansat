import 'package:get/get.dart';
import 'package:urbansat/modules/login/login_controller.dart';
import 'package:urbansat/modules/vehicles/vehicles_controller.dart';

class LastTravelController extends GetxController {
  final login = Get.put(LoginController());
  final vehicles = Get.put(VehiclesController());

  final List<String> _vehiclesList = RxList<String>();

  List<String> get vehiclesList => this._vehiclesList;
  set vehiclesList(List<String> vehicleList) => vehiclesList;

  getListVehicles() {
    vehicles.vehicles.forEach((e) => vehiclesList.add(e.placa.toString()));
  }
}
