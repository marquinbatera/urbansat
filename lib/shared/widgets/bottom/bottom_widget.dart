import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:urbansat/shared/themes/app_colors.dart';

class BottomWidget extends StatelessWidget {
  final String route;
  const BottomWidget({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      height: size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Get.toNamed('/home');
            },
            splashRadius: 20,
            icon: Icon(
              FontAwesomeIcons.chartBar,
              color: route == 'home' ? AppColors.primary : AppColors.stroke,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/vehicles');
            },
            splashRadius: 20,
            icon: Icon(
              FontAwesomeIcons.car,
              color: route == 'vehicles' ? AppColors.primary : AppColors.stroke,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/reports');
            },
            splashRadius: 20,
            icon: Icon(
              FontAwesomeIcons.fileAlt,
              color: route == 'reports' ? AppColors.primary : AppColors.stroke,
            ),
          )
        ],
      ),
    );
  }
}
