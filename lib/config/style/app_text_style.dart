import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_theme.dart';

class AppTextStyle {
  static const _fs12 = 12.0;
  static const _fs16 = 16.0;
  static const _fs20 = 20.0;

  static const appBarTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: _fs16,
    fontFamily: AppTheme.fontFamily,
  );
  static const message =
      TextStyle(fontWeight: FontWeight.w700, fontSize: _fs20);

  static const justWhite = TextStyle(color: Colors.white);

  static const quoteCardContent =
      TextStyle(fontWeight: FontWeight.w600, fontSize: _fs16);

  static const darkGreySize12 =
      TextStyle(fontSize: _fs12, color: AppColors.darkGrey);
}
