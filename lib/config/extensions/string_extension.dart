import 'dart:math' as math;

extension StringExtensions on String {
  /// example: 'hello world'.allInCaps => Hello world
  String get inCaps => isEmpty
      ? this
      : length == 1
          ? this[0].toUpperCase()
          : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String get localFileName {
    final slashIndex = math.max(lastIndexOf('/'), lastIndexOf('\\'));
    return substring(slashIndex + 1);
  }
}
