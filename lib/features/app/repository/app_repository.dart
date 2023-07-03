import 'package:dartz/dartz.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/geolocation/geo_utils.dart';
import 'package:properties/core/network_info/network_info.dart';
import 'package:properties/core/utils/core_utils.dart';

class AppRepository {
  final NetworkInfo networkInfo;
  AppRepository({
    required this.networkInfo,
  });



  Future<Either<Failure, bool>> cacheUserAddress() async {
    final result = await GeoUtils.determineLocationAddress();
    if (result is GeoAddressCompleted) {
      final addresses = result.addresses;
      final localities = result.localities;
      final country = result.country;
      pp(addresses);
      pp(localities);
      pp(country);
      return const Right(true);
    } else if (result is GeoLocationFailed) {
      return Left(CommonFailure('', result.error));
    } else {
      return const Left(UnknownFailure('Unknown error'));
    }
  }
}
