import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecoration {
  static const radius8 = Radius.circular(8);

  static const borderRad8 = BorderRadius.all(radius8);

  static const prmClrBorderSide = BorderSide(color: AppColors.primaryColor);

  static const gradientDec = BoxDecoration(
      gradient: RadialGradient(
          colors: AppColors.grad, stops: [0, 100], center: Alignment.center));
  static const borderPrmClr = Border(
      top: prmClrBorderSide,
      bottom: prmClrBorderSide,
      left: prmClrBorderSide,
      right: prmClrBorderSide);

  static const midShadowOffset22 = [
    BoxShadow(
        blurRadius: 10,
        spreadRadius: 2,
        color: AppColors.midShadow,
        offset: Offset(2, 2))
  ];

  static const quoteCardDec = BoxDecoration(
    gradient: LinearGradient(colors: AppColors.grad),
    boxShadow: midShadowOffset22,
    border: borderPrmClr,
    borderRadius: borderRad8,
  );
}
