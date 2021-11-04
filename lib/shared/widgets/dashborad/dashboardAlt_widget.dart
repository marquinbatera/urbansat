import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';

class DashboardAltWidget extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final int valor1;
  final int valor2;
  final int valor3;
  final int valor4;
  const DashboardAltWidget({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.valor1,
    required this.valor2,
    required this.valor3,
    required this.valor4,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.05,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: TextStyles.titleListTile,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: size.height * 0.35,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.35,
                  width: size.width * 0.48,
                  // color: AppColors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * 0.08,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        // color: AppColors.grey,
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: 4,
                              decoration: BoxDecoration(
                                color: AppColors.success,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(right: 5),
                            ),
                            Text.rich(
                              TextSpan(
                                text: '$text1 \n',
                                style: TextStyles.trailingRegular,
                                children: [
                                  TextSpan(
                                      text: valor1.toString(),
                                      style: TextStyles.buttonBoldGray)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.08,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        // color: AppColors.grey,
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: 4,
                              decoration: BoxDecoration(
                                color: AppColors.alert,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(right: 5),
                            ),
                            Text.rich(
                              TextSpan(
                                text: '$text2 \n',
                                style: TextStyles.trailingRegular,
                                children: [
                                  TextSpan(
                                      text: valor2.toString(),
                                      style: TextStyles.buttonBoldGray)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.08,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        // color: AppColors.grey,
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: 4,
                              decoration: BoxDecoration(
                                color: AppColors.warning,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(right: 5),
                            ),
                            Text.rich(
                              TextSpan(
                                text: '$text3 \n',
                                style: TextStyles.trailingRegular,
                                children: [
                                  TextSpan(
                                      text: valor3.toString(),
                                      style: TextStyles.buttonBoldGray)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.08,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        // color: AppColors.grey,
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: 4,
                              decoration: BoxDecoration(
                                color: AppColors.delete,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(right: 5),
                            ),
                            Text.rich(
                              TextSpan(
                                text: '$text4 \n',
                                style: TextStyles.trailingRegular,
                                children: [
                                  TextSpan(
                                      text: valor4.toString(),
                                      style: TextStyles.buttonBoldGray)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 10,
                  width: size.width * 0.44,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  // color: Colors.blue,
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: 40,
                      sectionsSpace: 2,
                      startDegreeOffset: 180,
                      sections: [
                        PieChartSectionData(
                          value: valor1.toDouble(),
                          color: AppColors.success,
                          radius: 35,
                          titleStyle: TextStyles.buttonBackground,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: valor2.toDouble(),
                          color: AppColors.alert,
                          radius: 30,
                          titleStyle: TextStyles.buttonBackground,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: valor3.toDouble(),
                          color: AppColors.warning,
                          radius: 25,
                          titleStyle: TextStyles.buttonBackground,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: valor4.toDouble(),
                          color: AppColors.delete,
                          radius: 20,
                          titleStyle: TextStyles.buttonBackground,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
