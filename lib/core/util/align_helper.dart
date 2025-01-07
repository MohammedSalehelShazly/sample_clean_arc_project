import 'package:flutter/material.dart';

extension AlignHelper on BuildContext {
  TextDirection get dir => Directionality.of(this);

  bool get isRtl => dir == TextDirection.rtl;
}
