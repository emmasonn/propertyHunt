import 'dart:convert';
import 'package:equatable/equatable.dart';

class PropertyDetail extends Equatable {
  final String? rooms;
  final String? bedrooms;
  final String? bathrooms;
  final String? yearBuilt;
  final String? garage;

  const PropertyDetail({
    this.rooms,
    this.bedrooms,
    this.bathrooms,
    this.yearBuilt,
    this.garage,
  });

  factory PropertyDetail.fromMap(Map<String, dynamic> data) {
    return PropertyDetail(
        rooms: data['rooms'],
        bathrooms: data['bathrooms'],
        bedrooms: data['bedrooms'],
        yearBuilt: data['year_built']);
  }

  Map<String, dynamic> toJson() {
    final body = {
      'rooms': rooms,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'year_built': yearBuilt
    };
    return body;
  }

  factory PropertyDetail.fromJsonString(String source) {
    final data = json.decode(source);
    return PropertyDetail(
        rooms: data['rooms'],
        bathrooms: data['bathrooms'],
        bedrooms: data['bedrooms'],
        yearBuilt: data['year_built']);
  }

  String get toJsonString {
    final data = {
      'rooms': rooms,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'year_built': yearBuilt
    };
    return json.encode(data);
  }
  
  @override
  List<Object?> get props => [
    rooms,
    bathrooms,
    bedrooms,
    yearBuilt,
  ];

}
