import 'package:intl/intl.dart';

extension DatetimeParser on DateTime {
  String toHour() {
    return DateFormat().add_Hm().format(this);
  }

  String toDate() {
    return DateFormat("EEEE, MMMM d").format(this);
  }

  String formatingDate() {
    final date = DateFormat.yMMMMd().format(this);
    final time = DateFormat.Hms().format(this);

    return "$date $time";
  }
}
