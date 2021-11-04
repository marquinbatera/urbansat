import 'package:flutter/material.dart';
import 'package:urbansat/shared/themes/app_images.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';

class BoxInfoWidget extends StatelessWidget {
  final String imagem;
  final String title;
  final String info;
  final double boxHeight;
  final double boxWidth;
  final double boxTextWidth;
  const BoxInfoWidget({
    Key? key,
    required this.imagem,
    required this.title,
    required this.info,
    required this.boxWidth,
    required this.boxTextWidth,
    required this.boxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: boxHeight,
      width: boxWidth, //190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              imagem,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            width: boxTextWidth,
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    title,
                    style: TextStyles.buttonBoldGray,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    info,
                    style: TextStyles.captionBoldBody,
                    textAlign: TextAlign.right,
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
