import 'package:flutter/material.dart';

import '../../core/strings/translation.dart';
import '../style/app_text_style.dart';

class UndefinedRoute extends StatelessWidget {
  const UndefinedRoute(this.routName, {super.key});
  final String? routName;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        tr_page_not_founded,
        style: AppTextStyle.message,
        textAlign: TextAlign.center,
      )),
    );
  }
}
