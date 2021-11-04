import 'package:flutter/material.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';

class BadgeWidget extends StatelessWidget {
  final String text;
  final Color color;
  const BadgeWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 2,
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      child: Text(
        text,
        style: TextStyles.captionBoldShape,
      ),
    );
  }
}
