import 'package:ecommerce/core/utils/date_time_extension.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime parseTimeSpanStringToDateTime(String timeSpan) {
    var departureTimeStr = DateTime.now().toDateString() + ' ' + timeSpan;
    return DateTime.parse(departureTimeStr);
  }

  static DateTime parseTimeSpanStringToDateTimeWithDate(
      String timeSpan, DateTime date) {
    var departureTimeStr = date.toDateString() + ' ' + timeSpan;
    return DateTime.parse(departureTimeStr);
  }

  static String getDateTimeFromStringBO(
    String dateTimeString,
    bool getOnlyDate,
  ) {
    var dateTime = DateTime.parse(dateTimeString);

    if (getOnlyDate) {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } else {
      return DateFormat('hh:mm - dd/MM/yyyy').format(dateTime);
    }
  }
}
