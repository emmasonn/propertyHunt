import 'package:equatable/equatable.dart';

abstract class DataModel extends Equatable {
  final String? id;
  const DataModel({
    this.id,
  });
}

class AuthUserModel extends Equatable {
  final String id;
  final String email;
  final String photoURL;
  const AuthUserModel({
    required this.id,
    required this.email,
    required this.photoURL,
  });

  @override
  List<Object?> get props => [id, email, photoURL];
}
