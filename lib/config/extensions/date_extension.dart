import '../../core/strings/translation.dart';
import '../helpers/helper.dart';
import 'string_extension.dart';

const _months = [
  tr_jan,
  tr_feb,
  tr_mar,
  tr_apr,
  tr_may,
  tr_jun,
  tr_jul,
  tr_aug,
  tr_sep,
  tr_oct,
  tr_nov,
  tr_dec,
];
const _weekDay = [
  tr_monday,
  tr_tuesday,
  tr_wednesday,
  tr_thursday,
  tr_friday,
  tr_saturday,
  tr_sunday,
];

extension DateExtension on DateTime {
  static DateTime get now => DateTime.now().toUtc();
  static DateTime get nullDate => DateTime(1900);

  bool get isNull =>
      day == nullDate.day && month == nullDate.month && year == nullDate.year;

  static DateTime toDateTime(dynamic date) {
    return (DateTime.tryParse(date.toString()) ?? nullDate).toLocal();
  }

  bool get isToday {
    final today = now.toLocal();
    final local = toLocal();
    return local.day == today.day &&
        local.month == today.month &&
        local.year == today.year;
  }

  int get _diffDays {
    final diff = toLocal().difference(now.toLocal());
    // maybe this = 11:59am and not is 00:00, difference is just 1 min but it's yesterday !
    if (diff.inDays == 0 && diff.inHours < 24 && !isToday) return 1;
    return diff.inDays;
  }

  bool get _atThisWeek {
    final locale = now.toLocal();
    return month == locale.month && year == locale.year
        ? (_diffDays < 7 && _diffDays > 0)
        : false;
  }

  bool get isAtThisYear => year == now.toLocal().year;

  static String _addZero(int n) {
    final str = '$n';
    return str.length == 1 ? '0$str' : str;
  }

  static String _monthName(int month) =>
      // [month - 1] is = index at _months list.
      _months.elementAt(month - 1).inCaps;

  String get _weekDayStr =>
      (isToday ? tr_today : _weekDay.elementAt(toLocal().weekday - 1)).inCaps;

  String get aboutDays => switch (_diffDays) {
        1 => tr_yesterday,
        2 => tr_2_days,
        3 => tr_3_days,
        4 => tr_4_days,
        5 => tr_5_days,
        6 => tr_6_days,
        7 => tr_7_days,
        _ => ''
      };

  String _date({
    required bool withMonthName,
    required bool withToday,
    required bool alwaysShowYear,
    required bool aboutDays,
    required String separator,
  }) {
    if (withToday && isToday) return tr_today;
    final y = !alwaysShowYear && isAtThisYear ? '' : '$year';
    return aboutDays && _atThisWeek
        ? this.aboutDays
        : withMonthName
            ? '$day$separator${_monthName(month)}$separator$y'
            : '${_addZero(day)}$separator${_addZero(month)}$separator$y';
  }

  String _time() {
    final isPM = hour > 12;
    final h = isPM ? hour - 12 : hour;
    final zoneStr = isPM || hour == 12 ? tr_pm : tr_am;
    return '${_addZero(h)}:${_addZero(minute)} ${zoneStr}';
  }

  String format({
    bool showDate = true,
    bool showTime = true,
    bool withMonthName = true,
    bool withToday = true,
    bool alwaysShowYear = true,
    bool aboutDays = true,
    String separator = '-',
  }) {
    if (isNull) return '';
    final date = showDate
        ? _date(
            withMonthName: withMonthName,
            aboutDays: aboutDays,
            alwaysShowYear: alwaysShowYear,
            separator: separator,
            withToday: withToday,
          )
        : '';
    final time = showTime ? _time() : '';
    final result = _clear('$date - $time', separator);
    return result;
  }

  String _clear(String date, String separator) {
    date = date.trim();
    if (date.startsWith('-')) {
      date = date.replaceFirst('-', '');
    }
    if (date.endsWith('-')) {
      date = date.substring(0, date.length - 2);
    }
    while (date.startsWith(separator)) {
      date = date.replaceFirst(separator, '');
    }
    while (date.endsWith(separator)) {
      date = date.substring(0, date.length - 2);
    }
    return date;
  }

  /// convert form 'YYYY-MM-DD' format
  static DateTime fromDateField(String dateStr) {
    final regExp = RegExp(r'(\d{4})-(\d{1,2})-(\d{1,2})');
    final match = regExp.firstMatch(dateStr);
    if (match == null) {
      printDB("[DateExtension.fromDateField] can't parse '$dateStr'");
      return nullDate;
    }
    final year = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final day = int.parse(match.group(3)!);
    return DateTime(year, month, day).toLocal();
  }

  /// upload => YYYY-MM-DD
  static String toDateField(DateTime date, {bool upload = false}) {
    final d = _addZero(date.day);
    final m = !upload ? _monthName(date.month) : _addZero(date.month);
    final y = date.year;
    return upload ? '$y-$m-$d' : '$d $m $y';
  }
}
