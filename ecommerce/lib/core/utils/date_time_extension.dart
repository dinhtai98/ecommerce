import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString() {
    return DateFormat("yyyy-MM-dd").format(this);
  }
}
