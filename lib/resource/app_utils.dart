import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:properties/features/properties/model/property_model.dart';

void pp(Object? object) {
  if (kDebugMode) {
    pp(object);
  }
}

Future<void> requestLocationPermission() async {
  if (await Geolocator.checkPermission() == LocationPermission.denied) {}
}

String cleanPropertyArea(PropertyModel model) {
  String area;
  final areaList = model.area!.split(' ');
  if (areaList.length > 1) {
    area = areaList[0];
  } else {
    area = areaList.first;
  }
  return area;
}

String cleanPropertyState(PropertyModel model) {
  String state;
  final stateList = model.state!.split(' ');
  if (stateList.length > 1) {
    state = stateList.last;
  } else {
    state = stateList.first;
  }
  return state;
}
