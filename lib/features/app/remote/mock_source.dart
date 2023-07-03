import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:properties/core/utils/core_utils.dart';
import 'package:properties/features/properties/model/property_model.dart';

class MockSource {

  Future<List<dynamic>> loadJson(String assetsPath) async {
    final String json = await rootBundle.loadString(assetsPath);
    return jsonDecode(json) as List<dynamic>;
  }
  //converts the list<dynamic> to List<PropertyModel>
  Future<List<PropertyModel>> getProperties() async {
    final propertiesMap = await loadJson('assets/json/properties.json');
    try {
      return propertiesMap.take(10).map(
        (property) {
          return PropertyModel.fromMap(property as Map<String, dynamic>);
        },
      ).toList();
    } on Exception catch (e) {
      pp(e);
      throw const FormatException();
    }
  }
}
