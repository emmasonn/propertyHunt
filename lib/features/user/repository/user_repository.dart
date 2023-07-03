import 'package:dartz/dartz.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/firebase_services/firebase_runner.dart';
import 'package:properties/core/firebase_services/realtime_database_source.dart';
import 'package:properties/core/network_info/network_info.dart';
import 'package:properties/core/service_runner/service_runner.dart';
import 'package:properties/features/user/model/user_model.dart';
import 'package:properties/features/user/usecase/create_user.dart';
import 'package:properties/features/user/usecase/view_user.dart';

class UserRepository {
  final CustomRealTimeDatabaseSource<UserModel> customRealTimeDatabaseSource;
  final NetworkInfo networkInfo;

  UserRepository({
    required this.customRealTimeDatabaseSource,
    required this.networkInfo,
  });

  //this function create user
  Future<Either<Failure, UserModel?>> createUser(
      CreateUserParams params) async {
    return FirebaseRunner<UserModel?>(networkInfo).runNetworkTask(() {
      final user = UserModel(
        name: params.name,
        imageUrl: params.imageUrl,
        phone: params.phone,
        email: params.email,
        address: params.address,
      );
      return customRealTimeDatabaseSource.setItem(user);
    });
  }

  //this function get all users.
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    return ServiceRunner<List<UserModel>>(networkInfo: networkInfo)
        .runNetworkTask(() => customRealTimeDatabaseSource.getItems());
  }

  //get a single user using their id
  Future<Either<Failure, UserModel?>> viewUser(GetUserParams params) async {
    return ServiceRunner<UserModel?>(networkInfo: networkInfo)
        .runNetworkTask(() => customRealTimeDatabaseSource.viewItem(params.id));
  }
}
