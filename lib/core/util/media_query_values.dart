import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  double get height => _mediaQuery.size.height;
  double get width => _mediaQuery.size.width;
  bool get isPortrait => height > width;
  double get screenTopPad => _mediaQuery.padding.top;

  /// get the largest dimension, the screen height or width
  double get responsiveH => isPortrait ? height : width;

  /// get the smallest dimension, the screen height or width
  double get responsiveW => isPortrait ? width : height;
}
