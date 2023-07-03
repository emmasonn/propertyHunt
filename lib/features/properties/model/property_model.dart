import 'dart:convert';

import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/core/utils/core_utils.dart';
import 'package:properties/features/properties/model/property_detail.dart';

class PropertyModel extends DataModel {
  final String? id;
  final String? propertyId;
  final String? ownerId;
  final String? title;
  final String? description;
  final String? listingType;
  final String? propertyType;
  final String? propertyViews;
  final String? status;
  final String? price;
  final String? propertySize;
  final String? address;
  final String? city;
  final String? area;
  final String? state;
  final String? country;
  final String? zip;
  final List<String>? locationTag;
  final List<String>? imageUrls;
  final String? lastUpdated;
  final PropertyDetail? detail;

  const PropertyModel({
    this.id,
    this.propertyId,
    this.ownerId,
    this.title,
    this.description,
    this.listingType,
    this.propertyType,
    this.propertyViews,
    this.status,
    this.price,
    this.propertySize,
    this.address,
    this.city,
    this.area,
    this.state,
    this.country,
    this.zip,
    this.locationTag,
    this.imageUrls,
    this.lastUpdated,
    this.detail,
  });

  factory PropertyModel.fromMap(Map<String, dynamic> data) {
    return PropertyModel(
      id: data['id'],
      propertyId: data['property_id'],
      ownerId: data['owner_id'],
      title: data['title'],
      description: data['description'],
      listingType: data['listing_type'],
      propertyType: data['property_type'],
      status: data['status'],
      propertyViews: data['number_of_page_views'].toString(),
      price: data['price'],
      propertySize: data['property_size'],
      detail: data['miscellaneous_details'] != 'None'
          ? PropertyDetail.fromMap(data['miscellaneous_details'])
          : null,
      address: data['address'],
      city: data['city'],
      area: data['area'],
      state: data['state'],
      country: data['country'],
      zip: data['zip'],
      locationTag: (data['location_tags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls: (data['images_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastUpdated: data['miscellaneous_details'].toString(),
    );
  }

  // factory PropertyModel.fromJson(String source) {
  //   final data = json.decode(source);
  //   return PropertyModel();
  // }

  Map<String, dynamic> get toJson {
    final body = {
      'id': id,
      'owner_id': ownerId,
      'title': title,
      'description': description,
      'listing_type': listingType,
      'property_type': propertyType,
      'status': status,
      'number_of_page_views': propertyViews,
      'price': price,
      'property_size': propertySize,
      'miscellaneous_details': detail?.toJson(),
      'address': address,
      'city': city,
      'area': area,
      'state': state,
      'country': country,
      'zip': zip,
      'location_tags': locationTag,
      'images_urls': imageUrls,
      'time_last_updated': lastUpdated,
    };
    return body;
  }

  String get toJsonString {
    final data = {};
    return json.encode(data);
  }

  @override
  List<Object?> get props => [
        id,
        ownerId,
      ];
}
