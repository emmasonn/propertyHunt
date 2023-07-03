import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'location.dart';

import '../helpers/helpers.dart';

class LocationProvider {
  static Future<List<Location>> fetchLocationsByCity(String query) async {
    final fileInput = await rootBundle.loadString('assets/locations.json');

    final List<Location> locations = [];

    if (query.isNotEmpty) {
      final locationsData = json.decode(fileInput);

      for (final locationData in locationsData) {
        final location = Location.fromMap(locationData);

        if (location.cityAscii.toLowerCase().startsWith(query.toLowerCase())) {
          if (!locations.contains(location)) {
            //Add location to list
            locations.add(location);

            //DEBUG
            pp(location.country);
          }
        }
      }
    }

    return locations;
  }

  static Future<List<String>> fetchLocationsByCountry(String query) async {
    final stringData = await rootBundle.loadString('assets/locations.json');

    List<String> countries = [];

    if (query.isNotEmpty) {
      for (final data in json.decode(stringData)) {
        final location = Location.fromMap(data);

        if (location.country.toLowerCase().startsWith(query.toLowerCase())) {
          if (!countries.contains(location.country)) {
            //Add location to list
            countries.add(location.country);

            //DEBUG
            pp(location.country);
          }
        }
      }
    }

    return countries;
  }

  
}
