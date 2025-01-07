import 'package:flutter/material.dart';

import '../style/app_text_style.dart';
import 'app_colors.dart';
import 'app_decoration.dart';

class AppTheme {
  static const fontFamily = 'Cairo';
  static const defaultFieldBorderRad = AppDecoration.borderRad8;
  static const defaultFieldBorderWidth = 1.5;
  static const defaultFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.appFieldBorder, width: defaultFieldBorderWidth),
    borderRadius: defaultFieldBorderRad,
  );
  static const defaultFieldFocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.primaryColor, width: defaultFieldBorderWidth),
    borderRadius: defaultFieldBorderRad,
  );

  static final appTheme = ThemeData(
    fontFamily: fontFamily,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: AppTextStyle.appBarTitle,
        iconTheme: IconThemeData(color: Colors.black)),
    brightness: Brightness.light,
    // useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
    ), // ColorScheme.fromSeed(seedColor: Colors.deepPurple)
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.secondaryColor,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
      hintStyle: TextStyle(color: AppColors.hint),
      iconColor: AppColors.hint,
      suffixIconColor: AppColors.hint,
      prefixIconColor: AppColors.hint,
      focusedBorder: defaultFieldFocusedBorder,
      border: defaultFieldBorder,
      enabledBorder: defaultFieldBorder,
    ),
    checkboxTheme: const CheckboxThemeData(
      side: BorderSide(color: AppColors.success, width: 2),
    ),
  );
}
