import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:urbansat/modules/home/home_controller.dart';
import 'package:urbansat/modules/login/login_controller.dart';
import 'package:urbansat/modules/vehicles/vehicles_controller.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_images.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';
import 'package:urbansat/shared/widgets/input_text/input_text_widget.dart';
import 'package:shared_preferences/shared_preferences.Dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  final LoginController controller = Get.put(LoginController());
  final user = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(AppImages.logoLogin),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Nunca foi tão simples gerenciar seus veículos',
                style: TextStyles.slogan,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                InputTextWidget(
                  label: "Usuário",
                  hint: "Digite o usuário",
                  icon: Icons.person,
                  controller: user,
                ),
                SizedBox(
                  height: 20,
                ),
                InputTextWidget(
                  label: "Senha",
                  hint: "Digite a senha",
                  icon: Icons.lock,
                  obscure: true,
                  controller: password,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        child: GestureDetector(
          onTap: () {
            controller.checkLogin(
              user: user.text,
              password: password.text,
            );
          },
          child: Container(
            width: size.width * 0.75,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'ENTRAR',
              style: TextStyles.buttonBoldBackground,
            ),
          ),
        ),
      ),
    );
  }
}
