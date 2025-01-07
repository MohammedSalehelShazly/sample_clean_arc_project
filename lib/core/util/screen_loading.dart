import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../config/helpers/helper.dart';

class ScreenLoading {
  const ScreenLoading();

  static Future<void> get show {
    printDB('ScreenLoading.show...');
    if (isShown) return Future.value();
    return EasyLoading.show(
      status: 'Loading...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static Future<void> get dismiss {
    if (!isShown) return Future.value();
    return EasyLoading.dismiss();
  }

  static bool get isShown => EasyLoading.isShow;
}
