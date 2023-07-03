import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../service_runner/custom_post_time_messages.dart';

///initial formatter to find the date txt
final DateFormat _formatter = DateFormat('yyyy-MM-dd');

extension DateParsing on DateTime {
  String get getText {
    // log(this);
    final now = DateTime.now();
    if (_formatter.format(now) == _formatter.format(this)) {
      return 'Today';
    } else if (_formatter.format(DateTime(now.year, now.month, now.day - 1)) ==
        _formatter.format(this)) {
      return 'Yesterday';
    } else {
      return '${DateFormat('d').format(this)} ${DateFormat('MMMM').format(this)} ${DateFormat('y').format(this)}';
    }
  }

  String get normalize {
    timeago.setLocaleMessages('en', MyCustomMessages());
    return timeago.format(this);
  }
}
