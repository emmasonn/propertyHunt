import 'package:dartz/dartz.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/features/properties/repository/property_respository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetProperties extends Usecase<List<PropertyModel>, NoParams> {
  final PropertyRepository propertyRepository;
  GetProperties(this.propertyRepository);

  @override
  Future<Either<Failure, List<PropertyModel>>> call(params) {
    return propertyRepository.getProperties();
  }
}
