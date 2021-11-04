import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbansat/modules/home/home_controller.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/widgets/app_bar/app_bar_page.dart';
import 'package:urbansat/shared/widgets/bottom/bottom_widget.dart';
import 'package:urbansat/shared/widgets/dashborad/dashboardAlt_widget.dart';
import 'package:urbansat/shared/widgets/dashborad/dashboard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final HomeController controller = Get.put(HomeController());

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      Timer.periodic(Duration(seconds: 40), (_) => controller.getDashboards());
    });

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(title: 'Dashboard'),
      body: Container(
        height: size.height * 0.77,
        color: AppColors.grey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(
              () => Column(
                children: <Widget>[
                  DashboardWidget(
                    title: 'Status dos Veículos',
                    textActive: 'Ativos',
                    textInactive: 'Inativos',
                    active: controller.dahsboard[0].devices!.active ?? 0,
                    inactive: controller.dahsboard[0].devices!.inactive ?? 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DashboardWidget(
                    title: 'Status dos Chips',
                    textActive: 'Chips Ativos',
                    textInactive: 'Chips Inativos',
                    active: controller.dahsboard[0].simcard!.active!,
                    inactive: controller.dahsboard[0].simcard!.count! -
                        controller.dahsboard[0].simcard!.active!,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DashboardAltWidget(
                    title: 'Transmissão',
                    text1: '1 Hora',
                    text2: '4 Horas',
                    text3: '12 Horas',
                    text4: '24 Horas',
                    valor1: controller.dahsboard[0].transmission!.green!,
                    valor2: controller.dahsboard[0].transmission!.yellow!,
                    valor3: controller.dahsboard[0].transmission!.orange!,
                    valor4: controller.dahsboard[0].transmission!.red!,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(
        route: 'home',
      ),
    );
  }
}
