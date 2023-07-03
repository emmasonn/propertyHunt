import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:properties/core/firebase_services/realtime_util.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/features/properties/repository/property_respository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetPagedProperties
    extends Usecase<List<PropertyModel>, GetPagedPropertiesParams> {
  final PropertyRepository propertyRepository;
  GetPagedProperties(this.propertyRepository);

  @override
  Future<Either<Failure, List<PropertyModel>>> call(params) {
    return propertyRepository.getPagedProperties(params);
  }
}

//startAfter or EndAfter and then orderby and then equal
class GetPagedPropertiesParams extends Equatable {
  final FilterSortClause? startAfter;
  final FilterSortClause? endAfter;
  final FilterSortClause? equalTo;
  final FilterSortClause? orderBy;
  final FilterSortClause? limitToStart;
  final FilterSortClause? limitToLast;

  const GetPagedPropertiesParams({
    this.startAfter,
    this.endAfter,
    this.equalTo,
    this.orderBy,
    this.limitToStart,
    this.limitToLast,
  });

  List<FilterSortClause> organiseFilters() {
    List<FilterSortClause> filterSorts = [];
    if (startAfter != null) {
      filterSorts.add(startAfter!);
    }
    if (endAfter != null) {
      filterSorts.add(endAfter!);
    }
    if (equalTo != null) {
      filterSorts.add(equalTo!);
    }
    if (orderBy != null) {
      filterSorts.add(orderBy!);
    }
    if (limitToStart != null) {
      filterSorts.add(limitToStart!);
    }
    if (limitToLast != null) {
      filterSorts.add(limitToLast!);
    }
    return filterSorts;
  }

  @override
  List<Object?> get props => [
        startAfter,
        endAfter,
        equalTo,
        orderBy,
        limitToStart,
        limitToLast,
      ];
}
