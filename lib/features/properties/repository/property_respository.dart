import 'package:dartz/dartz.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/firebase_services/firebase_runner.dart';
import 'package:properties/core/firebase_services/realtime_database_source.dart';
import 'package:properties/core/firebase_services/realtime_util.dart';
import 'package:properties/core/network_info/network_info.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/features/properties/usecases/get_paged_properties.dart';

class PropertyRepository {
  final CustomRealTimeDatabaseSource<PropertyModel>
      customRealTimeDatabaseSource;
  final NetworkInfo networkInfo;
  PropertyRepository({
    required this.customRealTimeDatabaseSource,
    required this.networkInfo,
  });

  //this is for testing sake
  Future<Either<Failure, List<PropertyModel>>> getProperties() =>
      FirebaseRunner<List<PropertyModel>>(networkInfo)
          .runNetworkTask(() => customRealTimeDatabaseSource.getItems());

  //get filtered sorted properties
  Future<Either<Failure, List<PropertyModel>>> getPagedProperties(
          GetPagedPropertiesParams params) =>
      FirebaseRunner<List<PropertyModel>>(networkInfo).runNetworkTask(() =>
          customRealTimeDatabaseSource
              .getPaginatedItems(params.organiseFilters()));

  //filter using status as trending
  Stream<List<PropertyModel>> getTrendings() {
    return customRealTimeDatabaseSource.subscribeTo([
      const FilterSortClause.orderByChild(fieldName: 'status'),
      const FilterSortClause.equals(fieldName: 'status', value: 'trending')
    ]);
  }
}
