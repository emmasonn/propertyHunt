import '../utils/enums.dart';

String? baseUrl;
String? apiBase;

// Initialize API Bases for PRODUCTION or for STAGING
void initApi(Environment env) {
  switch (env) {
    case Environment.production:
      baseUrl = 'https://iampots.com';
      apiBase = 'https://fender.iampots.com/api';
      break;

    case Environment.staging:
      baseUrl = 'https://iampots.com';
      apiBase = 'http://stagesov.iampots.com/api';
      break;
  }
}
