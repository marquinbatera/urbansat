import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';

class ListWidget extends StatelessWidget {
  final String url;
  final String id;
  final String? tipo;
  final String title;
  final String subTitle;
  final bool? ignition;
  final bool? active;
  final void Function() onTap;
  const ListWidget({
    Key? key,
    required this.url,
    required this.id,
    // required this.icon,
    required this.title,
    required this.subTitle,
    this.ignition,
    this.active,
    this.tipo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icons = {
      'Carro': FontAwesomeIcons.car,
      'Caminhão': FontAwesomeIcons.truck,
      'Caminhonete': FontAwesomeIcons.truckPickup,
      'Pessoal': FontAwesomeIcons.carAlt,
      'Moto': FontAwesomeIcons.motorcycle,
      'SUV': FontAwesomeIcons.truckPickup,
      'Van': FontAwesomeIcons.truckPickup,
    };

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: 58,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            tileColor: Colors.white,
            dense: true,
            leading: Icon(icons[tipo]),
            title: Text(title, style: TextStyles.titleListTile),
            subtitle: Text(
              subTitle,
              style: TextStyles.buttonBoldGray,
            ),
            trailing: Container(
              height: 55,
              width: 80,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.key,
                    color: ignition == true ? Colors.green[600] : Colors.grey,
                  ),
                  Icon(
                    Icons.online_prediction,
                    color: active == true ? Colors.green[600] : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
