import 'package:intl/intl.dart';

class DateTimeUtils {
  // ignore: non_constant_identifier_names
  static final DateFormat DD_MM_YYYY = DateFormat('dd.MM.yyyy');

  // ignore: non_constant_identifier_names
  static final DateFormat DD_MM_YY = DateFormat('dd/MM/yy');

  // ignore: non_constant_identifier_names
  static final DateFormat HH_MM = DateFormat('hh:mm');

  static String getStartEndInterval({
    required int timeEnd,
    required int timeStart,
  }) {
    final String endPeriod = HH_MM.format(DateTime.fromMillisecondsSinceEpoch(timeEnd));
    final String startPeriod = HH_MM.format(DateTime.fromMillisecondsSinceEpoch(timeStart));

    return '$startPeriod-$endPeriod';
  }

  static String getTimeStampFromTime({
    required DateTime date,
    required DateTime time,
  }) {
    final DateTime finalTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
      time.second,
    );
    return finalTime.millisecondsSinceEpoch.toString();
  }

  static DateTime get currentDate => DateTime.now();

  static DateTime get endOfTodayDate => DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        23,
        59,
      );

  static DateTime timestampToDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
}
