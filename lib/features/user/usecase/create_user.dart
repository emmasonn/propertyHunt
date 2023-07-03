import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:properties/features/user/model/user_model.dart';
import 'package:properties/features/user/repository/user_repository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class CreateUser extends Usecase<UserModel?, CreateUserParams> {
  final UserRepository userRepository;
  CreateUser(this.userRepository);

  @override
  Future<Either<Failure, UserModel?>> call(params) {
    return userRepository.createUser(params);
  }
}

class CreateUserParams extends Equatable {
  final String name;
  final String? imageUrl;
  final String? phone;
  final String? email;
  final String? address;

  const CreateUserParams({
    required this.name,
    this.imageUrl,
    this.email,
    this.phone,
    this.address,
  });

  @override
  List<Object?> get props => [
    name,
    imageUrl,
    phone,
    email,
    address,
  ];
}
