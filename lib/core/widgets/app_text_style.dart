import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class AppTextStyle {
  static double _xlargeFontSize = 22;
  static double _xLlargeFontSize = 30;
  static double _largeFontSize = 18;
  static double _mediumFontSize = 16;
  static double _smallFontSize = 14;
  static double _extraSmallFontSize = 12;

  /// Helper method to generate a TextStyle
  static TextStyle _getTextStyle({
    required double fontSize,
    String fontFamily = FontsFamily.TsukimiRegular,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize.h,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Extra Large Text Style
  static final textStylexLarge = _getTextStyle(
    fontSize: _xlargeFontSize,
    fontFamily: FontsFamily.TsukimiRegular,
  );

  /// Extra Extra Large Text Style
  static final textStylexLLarge = _getTextStyle(
    fontSize: _xLlargeFontSize,
    fontFamily: FontsFamily.TsukimiRegular,
    color: AppColors.blackColor,
  );

  /// Large Text Style (Bold)
  static final textStyleLargeBold = _getTextStyle(
    fontSize: _largeFontSize,
    fontFamily: FontsFamily.TsukimiBold,
  );

  /// Large Text Style (Normal)
  static final textStyleLargeNormal = _getTextStyle(
    fontSize: _largeFontSize,
    fontFamily: FontsFamily.TsukimiRegular,
  );

  /// Medium Text Style (Bold)
  static final textStyleMediumBold = _getTextStyle(
    fontSize: _mediumFontSize,
    fontFamily: FontsFamily.TsukimiBold,
    color: AppColors.blackColor,
  );

  /// Medium Text Style (Normal)
  static final textStyleMediumNormal = _getTextStyle(
    fontSize: _mediumFontSize,
    fontFamily: FontsFamily.TsukimiRegular,
    color: AppColors.blackColor,
  );

  /// Small Text Style (Bold)
  static final textStyleSmallBold = _getTextStyle(
    fontSize: _smallFontSize,
    fontFamily: FontsFamily.TsukimiBold,
    color: AppColors.blackColor,
  );

  /// Small Text Style (Normal)
  static final textStyleSmallNormal = _getTextStyle(
    fontSize: _smallFontSize,
    fontFamily: FontsFamily.TsukimiRegular,
    color: AppColors.blackColor,
  );

  /// Extra Small Text Style (Bold)
  static final textStyleXSmallBold = _getTextStyle(
    fontSize: _extraSmallFontSize,
    fontFamily: FontsFamily.TsukimiBold,
    color: AppColors.blackColor,
  );

  /// Extra Small Text Style (Normal)
  static final textStyleXSmallNormal = _getTextStyle(
    fontSize: _extraSmallFontSize,
    fontFamily: FontsFamily.TsukimiRegular,
    color: AppColors.blackColor,
  );

  /// Example: OpenSans Medium Style
  static final textStyleOpenSansMedium = _getTextStyle(
    fontSize: _mediumFontSize,
    fontFamily: FontsFamily.OpenSansMedium,
  );
}

class FontsFamily {
  static const String TsukimiRegular = "TsukimiRoundedRegular";
  static const String TsukimiLight = "TsukimiRoundedLight";
  static const String TsukimiMedium = "TsukimiRoundedMedium";
  static const String TsukimiSemiBold = "TsukimiRoundedSemiBold";
  static const String TsukimiBold = "TsukimiRoundedBold";
  static const String OpenSansRegular = "OpenSansRegular";
  static const String OpenSansLight = "OpenSansLight";
  static const String OpenSansMedium = "OpenSansMedium";
  static const String OpenSansSemiBold = "OpenSansSemiBold";
  static const String OpenSansBold = "OpenSansBold";
}
