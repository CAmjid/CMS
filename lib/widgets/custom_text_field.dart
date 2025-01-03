import 'package:c_m_s_report_labortary/utils/constants/color_string.dart';
import 'package:c_m_s_report_labortary/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isFilled;
  final BorderSide borderSide;
  final double borderRadius;
  final TextEditingController controller;
  final String? hintText;
  const CustomTextField(
      {super.key,
      this.isFilled = true,
      this.borderSide = BorderSide.none,
      this.borderRadius = 20,
      required this.controller,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: isFilled,
          hintStyle: AppTextStyles.hintStyle,
          fillColor: AppColors().filledColor,
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: borderSide,
              borderRadius: BorderRadius.circular(borderRadius))),
    );
  }
}
