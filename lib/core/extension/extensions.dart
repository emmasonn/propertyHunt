extension StringExtension on String? {
  String get capitalizeFirst {
    return '${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}';
  }

  String get capitalizeFirstLetter {
    return '${this?.substring(0, 1).toUpperCase()}${this?.substring(1).toLowerCase()}';
  }

  DateTime? get toDateTime {
    if (this!.contains('/')) {
      final parts = this!.split('/');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } else if (this!.contains('-')) {
      final parts = this!.split('-');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } else {
      return null;
    }
  }

  bool get isEmptyOrNull =>
      this == null ||
      (this != null && this!.isEmpty) ||
      (this != null && this! == 'null');
}

extension DateTimeExtension on DateTime {
  String get toDateString {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
