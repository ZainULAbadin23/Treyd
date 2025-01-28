import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/initial_setting_service.dart';
import 'parse_color.dart';

class AppColors {
  static Color get halfwhiteColor => parseColor("#E2E7F0");
  static Color get whiteColor1 => parseColor("#F7F9FC");
  static Color get datePickerColor => parseColor("#9e9e9e");
  static Color get noRecordColor => parseColor("#757575");
  static const redColor = Colors.red;
  static Color get redColorDark => parseColor("#E44848");
  static Color get whiteColor => Colors.white;
  static Color get whiteColor2 => parseColor("#F1F6F9");
  static const greyColor = Colors.grey;
  static Color get blueGrey => parseColor("#07264D");
  static Color get greenColor => parseColor("#008b00");
  static Color get greenColor1 => parseColor("#39A798");
  static Color get greenColorLight => parseColor("#E6F9F1");
  static Color get tealColor800 => parseColor("#00695C");
  static Color get tealColor600 => parseColor("#00897B");
  static Color get orangeColorDark => parseColor("#ee6002");
  static Color get yellowColor => parseColor("#FFD600");
  static Color get lightBlack => parseColor("#5F636D");
  static Color get redColorShade => parseColor("#E57373");
  static Color get redColorShade2 => parseColor("#EF9191");

  static Color get blueColorShade => parseColor("#42A5F5");
  static Color get greyColor800 => parseColor("#424242");
  static Color get greyColor700 => parseColor("#616161");
  static Color get greyColor600 => parseColor("#757575");
  static Color get greyColor400 => parseColor("#BDBDBD");
  static Color get greyColor300 => parseColor("#3E3A54");
  static Color get greyColor200 => parseColor("#F0F0F0");
  static Color get greyColor100 => parseColor("#CBD2E0");
  static Color get greyColor500 => parseColor("#9E9E9E");
  static Color get greyColor900 => parseColor("#2D3648");
  static Color get customColor=>parseColor("#5D6166");
  static const transParentColor = Colors.transparent;
  static final primaryColor = Get.theme.primaryColor;
  static final primaryColorDark = Get.theme.primaryColorDark;
  static Color get blackColor => parseColor("#1A202C");

  static Color get accentColor => parseColor(Get.find<InitialSettingService>()
      .initialSettings
      .lightTheme!
      .accentColor!);

  static Color get scaffoldColor => parseColor(Get.find<InitialSettingService>()
      .initialSettings
      .lightTheme!
      .scaffoldColor!);
}
