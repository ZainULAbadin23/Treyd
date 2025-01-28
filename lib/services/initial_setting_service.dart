import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import '../core/assets/constants.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/parse_color.dart';
import '../data/preferences/app_preferences.dart';
import '../global-models/initial-setting-model/initial_setting_model.dart';

class InitialSettingService extends GetxService {
  late InitialSettingsModel initialSettings;

  Future<InitialSettingService> init() async {
    final response = await getJsonFile(kInitialSettingJson);
    if (response != null) {
      initialSettings = InitialSettingsModel.fromJson(response);
      if (AppPreferences.getAppEnvKey != null) {
        initialSettings.defaultEnvKey = AppPreferences.getAppEnvKey;
      }
    }
    return this;
  }

  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  ThemeMode getThemeMode() {
    if (initialSettings.defaultTheme == "dark") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark
            .copyWith(systemNavigationBarColor: Colors.black87),
      );
      return ThemeMode.dark;
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: Colors.white),
      );
      return ThemeMode.light;
    }
  }

  ThemeData getLightTheme() {
    final lightTheme = initialSettings.lightTheme!;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transParentColor,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: parseColor(lightTheme.primaryColor!),
    ));
    return ThemeData(
        primaryColor: parseColor(lightTheme.primaryColor!),
        primaryColorDark: parseColor(lightTheme.primaryDarkColor!),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: parseColor(lightTheme.accentColor!)),
        brightness: Brightness.light,
        dividerColor: parseColor(
          lightTheme.hintColor!,
        ),
        focusColor: parseColor(lightTheme.accentColor!),
        hintColor: parseColor(lightTheme.hintColor!),
        fontFamily: initialSettings.fontFamily,
        appBarTheme: AppBarTheme(
          color: parseColor(lightTheme.primaryColor!),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: parseColor(lightTheme.primaryColor!)),
        ),
        colorScheme: ColorScheme.light(
          primary: parseColor(lightTheme.primaryColor!),
          secondary: parseColor(lightTheme.accentColor!),
        ),
        scaffoldBackgroundColor: parseColor(lightTheme.scaffoldColor!),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.3),
          headlineSmall: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.3),
          headlineMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.3),
          displaySmall: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.3),
          displayMedium: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.4),
          displayLarge: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.4),
          titleSmall: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.2),
          titleMedium: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.2),
          bodyMedium: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.2),
          bodyLarge: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.2),
          bodySmall: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              color: parseColor(lightTheme.textColor!),
              height: 1.2),
        ));
  }

  ThemeData getDarkTheme() {
    final darkTheme = initialSettings.lightTheme!;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.transParentColor,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.transParentColor,
        statusBarIconBrightness: Brightness.dark));
    return ThemeData(
        primaryColor: parseColor(darkTheme.primaryColor!),
        primaryColorDark: parseColor(darkTheme.primaryDarkColor!),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: parseColor(darkTheme.accentColor!)),
        brightness: Brightness.light,
        dividerColor: parseColor(
          darkTheme.hintColor!,
        ),
        focusColor: parseColor(darkTheme.accentColor!),
        hintColor: parseColor(darkTheme.hintColor!),
        fontFamily: initialSettings.fontFamily,
        appBarTheme: AppBarTheme(
          color: parseColor(darkTheme.primaryColor!),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: parseColor(darkTheme.primaryColor!)),
        ),
        colorScheme: ColorScheme.light(
          primary: parseColor(darkTheme.primaryColor!),
          secondary: parseColor(darkTheme.accentColor!),
        ),
        scaffoldBackgroundColor: parseColor(darkTheme.scaffoldColor!),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.3),
          headlineSmall: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.3),
          headlineMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.3),
          displaySmall: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.3),
          displayMedium: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.4),
          displayLarge: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.4),
          titleSmall: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.2),
          titleMedium: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.2),
          bodyMedium: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.2),
          bodyLarge: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.2),
          bodySmall: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              color: parseColor(darkTheme.textColor!),
              height: 1.2),
        ));
  }
}
