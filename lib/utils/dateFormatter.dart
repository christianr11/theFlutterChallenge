import 'package:intl/intl.dart';

class DateUtil {
  static const DATE_FORMAT = 'MMM, dd';
  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).add_jm().format(dateTime);
  }
}
