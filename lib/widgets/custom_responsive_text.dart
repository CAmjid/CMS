import 'package:c_m_s_report_labortary/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  const CustomResponsiveText(
      {super.key,
      required this.text,
      this.style,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Text(
      text,
      style: style ?? AppTextStyles.blackBodyText1,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
    ));
  }
}
