import 'package:dartz/dartz.dart';
import 'package:properties/features/app/repository/app_repository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class CacheUserAddress extends Usecase<bool, NoParams> {
  final AppRepository appRepository;
  CacheUserAddress(this.appRepository);

  @override
  Future<Either<Failure, bool>> call(params) {
    return appRepository.cacheUserAddress();
  }
}
