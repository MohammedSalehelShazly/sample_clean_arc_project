import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/helpers/helper.dart';
import '../../config/style/app_colors.dart';
import '../../config/style/app_text_style.dart';
import '../error/failure.dart';

enum SnackBarState { success, note, failed }

class AppSnackBar {
  static void show(
      BuildContext context, String? message, SnackBarState snackBarState) {
    if (message == null) return;
    try {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(message, style: AppTextStyle.justWhite),
          backgroundColor: _snackBarBg(snackBarState),
        ));
      // printDB('SnackBar show => $message');
    } catch (e) {
      printDB('AppSnackBar.show err: $e');
      showToast(message, snackBarState);
    }
  }

  static void showFailureSnackBar(BuildContext context, Failure failure) =>
      AppSnackBar.show(
          context, Helper.failureMessage(failure), SnackBarState.failed);

  static Future<bool?> showToast(
      String message, SnackBarState snackBarState) async {
    if (Platform.isWindows) {
      printDB('[showToast] platform-not-implemented => $message');
      return Future.value(null);
    }
    await Fluttertoast.cancel();
    return await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: _snackBarBg(snackBarState),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<bool?> showFailureToast(Failure failure) =>
      AppSnackBar.showToast(
          Helper.failureMessage(failure), SnackBarState.failed);

  static Color _snackBarBg(SnackBarState snackBarState) =>
      switch (snackBarState) {
        SnackBarState.success => AppColors.success,
        SnackBarState.note => AppColors.snackbarNote,
        SnackBarState.failed => AppColors.failedColor,
      };
}
