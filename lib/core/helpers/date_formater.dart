import 'dart:convert';

import '../extension/date_extension.dart';

import '../utils/lists.dart';

String formatDateFromString(String data, {String? separattor}) {
  final split = data.split(separattor ?? '-');

  final year = split.first;
  final month = nameMonth(int.tryParse(split[1])!);
  final day = split.last;

  return '$day $month, $year';
}

String nameMonth(int index, {bool? fullName}) {
  final monthName = fullName == null
      ? shortMonth
      : fullName
          ? fullMonth
          : shortMonth;

  switch (index) {
    case 1:
      return monthName[0];
    case 2:
      return monthName[1];
    case 3:
      return monthName[2];
    case 4:
      return monthName[3];
    case 5:
      return monthName[4];
    case 6:
      return monthName[5];
    case 7:
      return monthName[6];
    case 8:
      return monthName[7];
    case 9:
      return monthName[8];
    case 10:
      return monthName[9];
    case 11:
      return monthName[10];
    case 12:
      return monthName[11];
    default:
      return '';
  }
}

String get greeting {
  final now = DateTime.now().hour;

  if (now < 12) {
    return 'Good morning';
  } else if (now >= 12 && now < 16) {
    return 'Good afternoon';
  } else {
    return 'Good evening';
  }
}

String clockTo12(String timeString) {
  final time = timeString.split(':');
  final hour = time.first;
  final minute = time.last;

  if (int.parse(hour) < 12) {
    return '${time.first}:${minute}AM';
  } else {
    return '${(int.parse(time.first) - 12)}:${minute.padLeft(2, '0')}PM';
  }
}

class DbDateTime {
  final String date;
  final String time;

  DbDateTime(this.date, this.time);

  factory DbDateTime.fromString(String data) {
    final split = data.split('T');

    String dateData = split.first;
    String timeData = split.last.substring(0, 5);

    return DbDateTime(dateData, clockTo12(timeData));
  }

  factory DbDateTime.fromJson(String source) {
    final data = json.decode(source);

    return DbDateTime(data['date'], data['time']);
  }

  String get string {
    return '$date   $time';
  }

  String get toJson {
    return json.encode({
      'date': date,
      'time': time,
    });
  }
}

String dateFromDateTime(DateTime dateTime,
    {bool? showTime, bool? showMonthName}) {
  final year = dateTime.year;
  final month = dateTime.month.toString().padLeft(2, '0');
  final day = dateTime.day.toString().padLeft(2, '0');
  final hour = dateTime.hour.toString();
  final minute = dateTime.minute.toString();

  if (showTime != null && showTime) {
    return '$year-$month-$day ${clockTo12('$hour:$minute')}';
  }

  if (showMonthName != null && showMonthName) {
    return '${int.parse(day)} ${nameMonth(int.parse(month))} $year';
  }

  return '$year-$month-$day';
}

DateTime computeDueDate(String orderDate) {
  if (orderDate.isNotEmpty) {
    final split = orderDate.split('-');

    final year = int.parse(split.first);
    final month = int.parse(split[1]);
    final day = int.parse(split.last);

    return DateTime(year, month, day);
  } else {
    return DateTime.now();
  }
}

String postDateTime(DbDateTime date) {
  final split = date.date.split('-');

  final DateTime dateTime = DateTime(
    int.parse(split.first),
    int.parse(split[1]),
    int.parse(split.last),
  );

  return dateTime.normalize;
}
