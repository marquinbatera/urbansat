import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:urbansat/modules/location/location_controller.dart';
import 'package:urbansat/modules/vehicles/vehicles_controller.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/widgets/app_bar/app_bar_page.dart';
import 'package:urbansat/shared/widgets/bottom/bottom_widget.dart';
import 'package:urbansat/shared/widgets/input_text/input_text_widget.dart';
import 'package:urbansat/shared/widgets/list/list_widget.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  final VehiclesController controller = Get.put(VehiclesController());
  final LocationController controllerLocation = Get.put(LocationController());
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(title: 'Veículos'),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: size.height * 0.10,
              alignment: Alignment.center,
              width: size.width * 0.80,
              child: InputTextWidget(
                  label: 'Buscar',
                  icon: FontAwesomeIcons.search,
                  hint: 'Digite uma placa',
                  controller: search,
                  onChanged: (value) {
                    controller.onChange(placa: value.toUpperCase());
                  }),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: size.height * 0.67,
                color: AppColors.grey,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.vehiclesList.length,
                    itemBuilder: (ctx, index) {
                      final vehicles = controller.vehiclesList;
                      return ListWidget(
                        url: '/location',
                        id: vehicles[index].id,
                        title: vehicles[index].placa ?? '',
                        subTitle: vehicles[index].modelo ?? '',
                        active: vehicles[index].ativo ?? true,
                        ignition: vehicles[index].ignicao ?? true,
                        tipo: vehicles[index].tipo,
                        onTap: () => controllerLocation.getCurrentLocation(
                          id: vehicles[index].id,
                          nomePlaca: vehicles[index].placa,
                          nomeModelo: vehicles[index].modelo,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomWidget(
        route: 'vehicles',
      ),
    );
  }
}
