import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:properties/features/business/model/business_model.dart';
import 'package:properties/features/business/repository/business_repository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class CreateBusiness extends Usecase<BusinessModel?, CreateBusinessParams> {
  final BusinessRepository businessRepository;
  CreateBusiness(this.businessRepository);

  @override
  Future<Either<Failure, BusinessModel?>> call(params) {
    return businessRepository.createBusiness(params);
  }
}

class CreateBusinessParams extends Equatable {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String? logo;
  final String? emblem;
  final List<String>? photos;
  final String? website;

  const CreateBusinessParams({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    this.photos,
    this.logo,
    this.emblem,
    this.website,
  });

  @override
  List<Object?> get props => [
    name,
    address,
    phone,
    email,
    logo,
    emblem,
    photos,
    website,
  ];
}
