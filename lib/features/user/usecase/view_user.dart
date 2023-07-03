import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:properties/features/user/model/user_model.dart';
import 'package:properties/features/user/repository/user_repository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class ViewUser extends Usecase<UserModel?, GetUserParams> {
  final UserRepository userRepository;
  ViewUser(this.userRepository);

  @override
  Future<Either<Failure, UserModel?>> call(params) {
    return userRepository.viewUser(params);
  }
}

class GetUserParams extends Equatable {
  final String id;
  const GetUserParams(this.id);
  @override
  List<Object?> get props => [
        id
      ];
}
