import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/utils/constant.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get medium14Black => TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  static TextStyle get black20TextStyle => TextStyle(
        fontSize: Constants.buttonFontSize20,
      );
  static TextStyle get blackTextStyle => TextStyle(
        fontSize: Constants.buttonFontSize20,
      );
  static TextStyle get white20TextStyle =>
      TextStyle(fontSize: Constants.buttonFontSize20, color: AppColors.white);
  static TextStyle get greyTextStyle =>
      TextStyle(fontSize: Constants.buttonFontSize20, color: AppColors.homeManagementTextColor);

  static TextStyle get buttonTextStyle =>
      TextStyle(color: AppColors.white, fontSize: Constants.normalFontSize18, fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,);

  static TextStyle get blackButtonTextStyle =>
      TextStyle(color: AppColors.black, fontSize: Constants.buttonFontSize20, fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,);

  static TextStyle get orangeTextStyle =>
      TextStyle(color: AppColors.buttonColor, fontSize: Constants.buttonFontSize20,fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,);

  static TextStyle get normalFont18 =>
      TextStyle(color: AppColors.white, fontSize: Constants.normalFontSize18, fontFamily: 'Raleway',
          fontWeight: FontWeight.w400);

  static TextStyle get normalFont20 =>
      TextStyle(color: AppColors.white, fontSize: Constants.buttonFontSize20, fontFamily: 'Raleway',
          fontWeight: FontWeight.w400);

  static TextStyle get headingTextItalic30 =>
      TextStyle(color: AppColors.white, fontSize: 40, fontFamily: 'Lobster',
        fontWeight: FontWeight.w400,);

  static TextStyle get textExtraLargeTextStyle =>
      TextStyle(color: AppColors.white, fontSize: Constants.extraLargeFontSize30, fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,);

  static TextStyle get textLargeTextStyle =>
      TextStyle(color: AppColors.white, fontSize: Constants.largeFontSize24, fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,);
}
