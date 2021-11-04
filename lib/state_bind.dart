import 'package:get/get.dart';
import 'package:urbansat/modules/login/login_controller.dart';
import 'package:urbansat/modules/vehicles/vehicles_controller.dart';

class StateBind implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<VehiclesController>(() => VehiclesController());
  }
}
