import 'dart:convert';

import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? state;
  final String city;
  final String cityAscii;
  final dynamic longitude;
  final dynamic latitude;
  final String country;
  final String code;

  const Location({
    this.state,
    required this.city,
    required this.cityAscii,
    required this.country,
    required this.longitude,
    required this.latitude,
    required this.code,
  });

  @override
  List<Object> get props => [city, longitude, latitude, code, country, state!];

  factory Location.fromJson(String jsonData) {
    final data = json.decode(jsonData);

    return Location(
      city: data['city'],
      cityAscii: data['city_ascii'],
      longitude: data['lng'],
      latitude: data['lat'],
      code: data['iso2'],
      state: data['admin_name'],
      country: data['country'],
    );
  }

  factory Location.fromMap(Map<String, dynamic> data) {
    return Location(
      city: data['city'],
      cityAscii: data['city_ascii'],
      longitude: data['lng'],
      latitude: data['lat'],
      code: data['iso2'],
      state: data['admin_name'],
      country: data['country'],
    );
  }
}
