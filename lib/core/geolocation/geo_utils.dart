import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:properties/core/utils/strings.dart';

class GeoUtils {
  //determines the location of any device.
  static Future<GeoLocationStatus> determineLocation() async {
    LocationPermission permission;
    if (!(await Geolocator.isLocationServiceEnabled())) {
      return GeoLocationFailed(locationDisabledWarning);
    }
    //initialize permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return GeoLocationFailed(locationDeniedError);
    }
    if (permission == LocationPermission.deniedForever) {
      return GeoLocationFailed(locationDeniedForever);
    }

    try {
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 30),
      );

      return GeoPositionCompleted(currentPosition);
    } on TimeoutException {
      return GeoLocationFailed(locationTimeOutError);
    }
  }

  //determine address
  static Future<GeoLocationStatus> determineLocationAddress() async {
    final status = await determineLocation();
    if (status is GeoPositionCompleted) {
      final postion = status.currentPosition;
      final plackmarks =
          await placemarkFromCoordinates(postion.latitude, postion.longitude);
      return GeoAddressCompleted(
        addresses: plackmarks.map((e) => e.street).toList(),
        localities: plackmarks.map((e) => e.locality).toList(),
        country: plackmarks.first.country ?? '',
      );
    } else {
      return status;
    }
  }
}

sealed class GeoLocationStatus {}

class GeoPositionCompleted extends GeoLocationStatus {
  final Position currentPosition;
  GeoPositionCompleted(this.currentPosition);
}

class GeoAddressCompleted extends GeoLocationStatus {
  final List<String?> addresses;
  final List<String?> localities;
  final String country;
  GeoAddressCompleted({
    required this.addresses,
    required this.localities,
    required this.country,
  });
}

class GeoLocationFailed extends GeoLocationStatus {
  final String error;
  GeoLocationFailed(this.error);
}
