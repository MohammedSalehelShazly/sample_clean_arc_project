import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  static const primaryColor = Color.fromARGB(255, 18, 176, 211);
  static const secondaryColor = Color(0xffDBB170);
  static const primaryColorOpc8 = Color.fromRGBO(18, 176, 211, 0.8);

  static const appFieldBorder = Color(0xffB7BBBE);
  static const hint = appFieldBorder;

  static const grad = [
    Color.fromRGBO(18, 176, 211, 0.5),
    Color.fromRGBO(18, 176, 211, 0.2)
  ];

  static const success = Color(0xff00CF90);
  static const snackbarNote = Color(0xFF757575);
  static const darkGrey = Color(0xff797979);

  static const failedColor = Color(0xffA70D0F);

  static const midShadow = Color.fromRGBO(0, 0, 0, 0.08);
}
