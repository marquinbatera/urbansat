import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';

class DashboardWidget extends StatelessWidget {
  final String title;
  final String textActive;
  final String textInactive;
  final int active;
  final int inactive;
  const DashboardWidget({
    Key? key,
    required this.textActive,
    required this.textInactive,
    required this.active,
    required this.inactive,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.33,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
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
            height: size.height * 0.28,
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  height: size.height * 0.20,
                  width: size.width * 0.48,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * 0.10,
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
                            Text.rich(TextSpan(
                              text: '$textActive \n',
                              style: TextStyles.trailingRegular,
                              children: [
                                TextSpan(
                                    text: active.toString(),
                                    style: TextStyles.buttonBoldGray)
                              ],
                            )),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.10,
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
                            Text.rich(TextSpan(
                              text: '$textInactive \n',
                              style: TextStyles.trailingRegular,
                              children: [
                                TextSpan(
                                    text: inactive.toString(),
                                    style: TextStyles.buttonBoldGray)
                              ],
                            )),
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
                          value: active.toDouble(),
                          color: Color(0xFF42B91F),
                          radius: 35,
                          titleStyle: TextStyles.buttonBackground,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: inactive.toDouble(),
                          color: AppColors.delete,
                          radius: 30,
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
