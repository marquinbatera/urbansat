import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:urbansat/modules/location/location_controller.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_images.dart';
import 'package:urbansat/shared/widgets/app_bar/app_bar_page.dart';
import 'package:urbansat/shared/widgets/badge/badge_widget.dart';
import 'package:urbansat/shared/widgets/bottom/bottom_widget.dart';
import 'package:urbansat/shared/widgets/box_info/box_info_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final LocationController controller = Get.put(LocationController());
  final format = DateFormat('dd/MM/yyyy hh:mm:ss');

  @override
  Widget build(BuildContext context) {
    setState(() {
      Timer.periodic(Duration(seconds: 50), (_) {
        controller.getLocation();
        print('carregou nova posição');
      });
    });

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(title: 'Localização'),
      body: Column(
        children: [
          /*
          GOOGLE MAPS
           */
          Container(
            height: size.height * 0.45,
            child: Obx(
              () => GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.currentPosition[0].latitude,
                      controller.currentPosition[0].longitude),
                  zoom: 18,
                ),
                myLocationEnabled: true,
                markers: controller.markers,
              ),
            ),
          ),

          /* 
          BOX INFORMATION CONTAINER
          */

          Expanded(
            flex: 1,
            child: Container(
              height: size.height * 0.32,
              decoration: BoxDecoration(
                color: AppColors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 5,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.stroke,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => BoxInfoWidget(
                            imagem: AppImages.iconCar,
                            title: controller.placa.value,
                            info: controller.modelo.value,
                            boxHeight: size.height * 0.09,
                            boxWidth: size.width * 0.46,
                            boxTextWidth: size.width * 0.31,
                          ),
                        ),
                        BoxInfoWidget(
                          imagem: AppImages.iconTime,
                          title: 'Data GPS',
                          info: format
                              .format(controller.currentPosition[0].dhGps!)
                              .toString(),
                          boxHeight: size.height * 0.09,
                          boxWidth: size.width * 0.46,
                          boxTextWidth: size.width * 0.31,
                        ),
                      ],
                    ),
                    BoxInfoWidget(
                      imagem: AppImages.iconPonto,
                      title: 'Endereço',
                      info: controller.currentPosition[0].enderecoAproximado ??
                          '',
                      boxHeight: size.height * 0.09,
                      boxWidth: size.width * 0.95,
                      boxTextWidth: size.width * 0.80,
                    ),
                    Container(
                      height: size.height * 0.09,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              AppImages.iconInfo,
                            ),
                          ),
                          Container(
                              width: size.width * 0.83,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                width: size.width * 0.75,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BadgeWidget(
                                      text: 'Ignição',
                                      color: controller
                                                  .currentPosition[0].ignicao ==
                                              true
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    BadgeWidget(
                                      text: 'Sleep',
                                      color: controller.currentPosition[0]
                                                  .modoSleep ==
                                              true
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    BadgeWidget(
                                      text: 'GPRS',
                                      color: controller.currentPosition[0]
                                                  .conexaoGprs ==
                                              true
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    BadgeWidget(
                                      text: 'GPS',
                                      color: controller.currentPosition[0]
                                                  .sinalGps ==
                                              true
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    BadgeWidget(
                                      text: 'Âncora',
                                      color: controller.currentPosition[0]
                                                  .ancorado ==
                                              true
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomWidget(
        route: 'location',
      ),
    );
  }
}
