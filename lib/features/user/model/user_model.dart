import 'package:properties/core/firebase_services/data_model.dart';

class UserModel extends DataModel {
  final String? id;
  final String name;
  final String? imageUrl;
  final String? priveledge;
  final String? phone;
  final String? email;
  final String? address;

  const UserModel({
    this.id,
    required this.name,
    this.imageUrl,
    this.priveledge,
    this.phone,
    this.email,
    this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      imageUrl: data['photo_url'],
      priveledge: data['priveledge'],
      phone: data['phone'],
      email: data['email'],
      address: data['address']
    );
  }

  Map<String, dynamic> get toJson {
    final body = {
      'id': id,
      'name': name,
      'photo_url': imageUrl,
      'priveledge': priveledge,
      'phone': phone,
      'email': email,
      'address': address,
    };
    return body;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        email,
        priveledge,
        imageUrl,
        address,
      ];
}
