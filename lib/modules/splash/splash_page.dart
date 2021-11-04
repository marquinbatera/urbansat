import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 4),
      () => Get.toNamed('/login'),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(AppImages.stelite),
      ),
    );
  }
}
