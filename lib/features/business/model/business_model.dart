import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/features/properties/model/contact_model.dart';

class BusinessModel extends DataModel {
  final String? id;
  final String name;
  final String? logo;
  final String? emblem;
  final List<String>? photos;
  final String? website;
  final ContactModel contactModel;

  const BusinessModel({
    this.id,
    required this.name,
    this.website,
    this.emblem,
    this.logo,
    this.photos,
    required this.contactModel,
  });

  factory BusinessModel.fromMap(Map<String, dynamic> data) {
    return BusinessModel(
      id: data['id'],
      name: data['name'],
      website: data['website'],
      logo: data['logo'],
      emblem: data['emblem'],
      photos: (data['photos']as List<dynamic>?)?.map((e) => e as String).toList(),
      contactModel: ContactModel.fromMap(
        data['contact_info'],
      ),
    );
  }

  Map<String, dynamic> get toJson {
    final body = {
      'id': id,
      'name': name,
      'website': website,
      'logo': logo,
      'emblem': emblem,
      'photos': photos,
      'contact_info': contactModel.toJson(),
    };
    return body;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        website,
        photos,
        emblem,
        logo,
        contactModel,
      ];
}
