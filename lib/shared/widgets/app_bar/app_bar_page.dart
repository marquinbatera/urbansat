import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urbansat/modules/login/login_controller.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';
import 'package:get/get.dart';

class AppBarWidget extends GetView<LoginController> with PreferredSizeWidget {
  final String title;
  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd/MM/yyyy hh:mm:ss');
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.primary,
      leading: BackButton(),
      leadingWidth: 25,
      title: Text(
        title,
        style: TextStyles.titleHome,
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 48,
                  width: 160,
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.maxFinite,
                        child: GetX<LoginController>(
                          builder: (_) => Text(
                            _.username.toString(),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.maxFinite,
                        child: Text(
                          format.format(DateTime.now()),
                          style: TextStyles.captionShape,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GetX<LoginController>(builder: (_) {
                return Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(_.userimage.toString()),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
