import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get medium14Black => TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  static TextStyle get black20TextStyle => TextStyle(
        fontSize: 20,
      );
  static TextStyle get blackTextStyle => TextStyle(
        fontSize: 18,
      );
  static TextStyle get white20TextStyle =>
      TextStyle(fontSize: 20, color: AppColors.white);
  static TextStyle get greyTextStyle =>
      TextStyle(fontSize: 20, color: AppColors.homeManagementTextColor);

  static TextStyle get buttonTextStyle =>
      TextStyle(color: AppColors.white, fontSize: 18);

  static TextStyle get blackButtonTextStyle =>
      TextStyle(color: AppColors.black, fontSize: 18);

  static TextStyle get backButtonTextStyle =>
      TextStyle(color: AppColors.lightTextColor, fontSize: 18);

  static TextStyle get memberTextStyle =>
      TextStyle(color: AppColors.lightTextColor, fontSize: 16);

  static TextStyle get mainTextSize30 =>
      TextStyle(color: AppColors.white, fontSize: 40, fontFamily: 'Lobster',
        fontWeight: FontWeight.w400,);
}
