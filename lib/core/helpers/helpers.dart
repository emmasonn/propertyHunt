import 'package:flutter/foundation.dart';

String normalizeUrl(String url) {
  if (!url.startsWith('http')) {
    return 'https://$url';
  } else {
    return url;
  }
}

void pp(Object? object) {
  if (kDebugMode) {
    print('$object');
  }
}
