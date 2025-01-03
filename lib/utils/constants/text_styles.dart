import 'package:c_m_s_report_labortary/utils/constants/color_string.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // static const TextStyle appBarTitle = TextStyle();
  static TextStyle blackBodyText1 =
      TextStyle(color: AppColors().normalTextColor);
  static TextStyle secondryBodyText1 =
      TextStyle(color: AppColors().secondaryTextColor);
  static TextStyle secondryBodyText2 =
      TextStyle(color: AppColors().secondaryTextColor, fontSize: 12);
  static TextStyle whiteBodyText1 =
      TextStyle(color: AppColors().primaryTextColor, fontSize: 18);
  static TextStyle whiteBodyText2 =
      TextStyle(color: AppColors().primaryTextColor, fontSize: 12);
  static TextStyle containerText1 =
      TextStyle(color: AppColors().normalTextColor, fontSize: 12);
  static TextStyle containerText2 =
      TextStyle(color: AppColors().secondaryTextColor, fontSize: 6);
  static TextStyle containerText3 =
      TextStyle(color: AppColors().primaryTextColor, fontSize: 12);
  static TextStyle containerDarkText = TextStyle(
      color: AppColors().darkTextColor,
      fontSize: 12,
      fontWeight: FontWeight.w600);

  static TextStyle whiteAppBarTitle =
      TextStyle(color: AppColors().primaryTextColor);
  static TextStyle hintStyle = TextStyle(
      color: AppColors().hintTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 16);
}
