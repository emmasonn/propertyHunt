import 'package:dartz/dartz.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/network_info/network_info.dart';
import 'package:properties/core/utils/strings.dart';

class FirebaseRunner<T> {
  final NetworkInfo networkInfo;
  FirebaseRunner(this.networkInfo);

  Future<Either<Failure, T>> runNetworkTask(
    Future<T> Function() task,
  ) async {
    try {
      final result = await task.call();
      return right(result);
    } on Exception {
      return left(const ServerFailure(serverFailure, errorMsg));
    }
  }
}
