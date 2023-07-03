import 'dart:convert';
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String? address;
  final String? phone;
  final String? email;

  const ContactModel({
    this.address,
    this.phone,
    this.email,
  });

  factory ContactModel.fromMap(Map<String, dynamic> data) {
    return ContactModel(
      address: data['address'],
      email: data['email'],
      phone: data['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final body = {
      'address': address,
      'email': email,
      'phone': phone,
    };
    return body;
  }

  factory ContactModel.fromJsonString(String source) {
    final data = json.decode(source);
    return ContactModel(
      address: data['address'],
      email: data['email'],
      phone: data['phone'],
    );
  }

  String get toJsonString {
    final data = {
      'address': address,
      'email': email,
      'phone': phone,
    };
    return json.encode(data);
  }

  @override
  List<Object?> get props => [
        address,
        email,
        phone,
      ];
}
