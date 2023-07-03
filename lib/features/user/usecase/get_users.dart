import 'package:dartz/dartz.dart';
import 'package:properties/features/user/model/user_model.dart';
import 'package:properties/features/user/repository/user_repository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetUsers extends Usecase<List<UserModel>, NoParams> {
  final UserRepository userRepository;
  GetUsers(this.userRepository);

  @override
  Future<Either<Failure, List<UserModel>>> call(params) {
    return userRepository.getUsers();
  }
}

