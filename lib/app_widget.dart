import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:urbansat/modules/location/location_page.dart';
import 'package:urbansat/modules/reports/main_reports.dart';
import 'package:urbansat/modules/vehicles/vehicles_page.dart';
import 'package:urbansat/state_bind.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: StateBind(),
      debugShowCheckedModeBanner: false,
      title: 'Urbansat',
      theme: ThemeData(
          primarySwatch: Colors.blue, primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/vehicles": (context) => VehiclesPage(),
        "/location": (context) => LocationPage(),
        "/reports": (context) => MainReports(),
      },
    );
  }
}
