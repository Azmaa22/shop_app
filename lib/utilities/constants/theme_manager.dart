import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class ThemeManager {
  static final ThemeData _lightMode = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.kPrimaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.kGrey,
        ),
      ),
    ),
    primaryColor: ColorManager.kPrimaryColor,
    backgroundColor: ColorManager.kWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.kPrimaryColor,
      foregroundColor: ColorManager.kWhite,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
  static final ThemeData _darkMode = ThemeData(
    primaryColor: ColorManager.kPrimaryColor,
    backgroundColor: ColorManager.kGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.kPrimaryColor,
      foregroundColor: ColorManager.kGrey,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
  static ThemeData getTheme({required bool isLightMode}) {
    return isLightMode ? _lightMode : _darkMode;
  }
}
