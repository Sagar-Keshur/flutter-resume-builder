import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  String toDobFormat() {
    return toFormat(DateTimeFormat.dMMMyyyy);
  }

  String toFormat(DateTimeFormat format) {
    return DateFormat(format.value).format(this);
  }
}

class DateTimeFormat {
  final String value;

  const DateTimeFormat._(this.value);

  static DateTimeFormat dMMMyyyy = const DateTimeFormat._('d MMM yyyy');
}
