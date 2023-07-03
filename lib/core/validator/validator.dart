String validateEntries(Map<String, bool> values) {
  String message = '';

  for (final i in values.entries) {
    if (i.value) {
      message = i.key;
      break;
    } else {
      message = '';
    }
  }

  return message;
}
