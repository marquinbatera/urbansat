import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:urbansat/models/location/location_model.dart';
import 'package:urbansat/modules/login/login_controller.dart';

class LocationController extends GetxController {
  final List<LocationModal> _currentPosition = RxList<LocationModal>();
  final RxString idVeiculo = RxString('');
  final RxString placa = RxString('');
  final RxString modelo = RxString('');
  Set<Marker> markers = Set<Marker>();

  List<LocationModal> get currentPosition => this._currentPosition;
  set currentPosition(List<LocationModal> currentPosition) => currentPosition;

  set idVeiculo(RxString value) => idVeiculo.value = value.toString();
  set placa(RxString value) => placa.value = value.toString();
  set modelo(RxString value) => modelo.value = value.toString();

  final login = Get.put(LoginController());

  setPosition() {
    if (currentPosition.isNotEmpty) {
      markers.assign(
        Marker(
          markerId: MarkerId(currentPosition[0].eqptSerial.toString()),
          position:
              LatLng(currentPosition[0].latitude, currentPosition[0].longitude),
        ),
      );
    } else {
      markers.assign(
        Marker(
          markerId: MarkerId('nenhum'),
          position: LatLng(-15.793889, -47.882778),
        ),
      );
    }
  }

  getLocation() async {
    var baseUrl = 'http://plataforma.urbansat.com.br/api_v2/?m=currentPosition';

    final response = await http.post(Uri.parse(baseUrl), body: {
      'txtToken': login.token.toString(),
      'txtIdVehicle': idVeiculo.value,
    });

    var json;
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      if (json['aData'].length > 0) {
        var resp = json['aData']
            .map<LocationModal>((currentPosition) =>
                LocationModal.fromMap(currentPosition as Map<String, dynamic>))
            .toList();

        currentPosition.assignAll(resp);
        await setPosition();
      }
    }
  }

  getCurrentLocation(
      {required String id, String? nomePlaca, String? nomeModelo}) async {
    var baseUrl = 'http://plataforma.urbansat.com.br/api_v2/?m=currentPosition';

    final response = await http.post(Uri.parse(baseUrl), body: {
      'txtToken': login.token.toString(),
      'txtIdVehicle': id,
    });

    var json;
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      if (json['aData'].length > 0) {
        var resp = json['aData']
            .map<LocationModal>((currentPosition) =>
                LocationModal.fromMap(currentPosition as Map<String, dynamic>))
            .toList();

        print('resp: $resp');

        currentPosition.assignAll(resp);
        idVeiculo.value = id.toString();
        placa.value = nomePlaca.toString();
        modelo.value = nomeModelo.toString();

        await setPosition();
        await Get.toNamed('/location');
      } else {
        Get.snackbar(
          'Atenção',
          'Esse veículo não tem posição atual',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
