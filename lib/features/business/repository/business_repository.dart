import 'package:dartz/dartz.dart';
import 'package:properties/core/extension/extensions.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/firebase_services/firebase_runner.dart';
import 'package:properties/core/firebase_services/firebase_storage.dart';
import 'package:properties/core/firebase_services/realtime_database_source.dart';
import 'package:properties/core/network_info/network_info.dart';
import 'package:properties/features/business/model/business_model.dart';
import 'package:properties/features/business/usecases/create_business.dart';
import 'package:properties/features/business/usecases/get_paged_businesses.dart';
import 'package:properties/features/properties/model/contact_model.dart';
import 'package:uuid/uuid.dart';

class BusinessRepository {
  final CustomRealTimeDatabaseSource<BusinessModel>
      customRealTimeDatabaseSource;
  final CustomFirebaseStorage firebaseStorage;
  final NetworkInfo networkInfo;

  BusinessRepository({
    required this.customRealTimeDatabaseSource,
    required this.firebaseStorage,
    required this.networkInfo,
  });

  Future<Either<Failure, List<BusinessModel>>> getPagedBusinesses(
          GetPagedBusinessesParams params) =>
      FirebaseRunner<List<BusinessModel>>(networkInfo).runNetworkTask(() =>
          customRealTimeDatabaseSource
              .getPaginatedItems(params.organiseFilters()));

  Future<Either<Failure, BusinessModel?>> createBusiness(
          CreateBusinessParams params) =>
      FirebaseRunner<BusinessModel?>(networkInfo).runNetworkTask(() async {
        // String? logo;
        // String? emblem;
        // List<String> photos = [];

        // if (!params.logo.isEmptyOrNull) {
        //   logo = await firebaseStorage.uploadFile(
        //       storagePath: '/${params.name}',
        //       fileId: const Uuid().v4(),
        //       filePath: params.logo!);
        // }

        // if (!params.emblem.isEmptyOrNull) {
        //   emblem = await firebaseStorage.uploadFile(
        //       storagePath: '/${params.name}',
        //       fileId: const Uuid().v4(),
        //       filePath: params.logo!);
        // }

        // params.photos?.forEach((photo) async {
        //   final photoUrl = await firebaseStorage.uploadFile(
        //     storagePath: '/${params.name}',
        //     fileId: const Uuid().v4(),
        //     filePath: photo,
        //   );
        //   photos.add(photoUrl);
        // });

        final businessModel = BusinessModel(
          name: params.name,
          contactModel: ContactModel(
              address: params.address,
              phone: params.phone,
              email: params.email),
        );

        return customRealTimeDatabaseSource.setItem(businessModel);
      });

  Future<Either<Failure, BusinessModel?>> updateBusiness(
          CreateBusinessParams params) =>
      FirebaseRunner<BusinessModel?>(networkInfo).runNetworkTask(() async {
        String? logo;
        String? emblem;
        // List<String> photos = [];

        if (!params.logo.isEmptyOrNull) {
          logo = await firebaseStorage.uploadFile(
              storagePath: '/${params.name}',
              fileId: const Uuid().v4(),
              filePath: params.logo!);
        }

        if (!params.emblem.isEmptyOrNull) {
          emblem = await firebaseStorage.uploadFile(
              storagePath: '/${params.name}',
              fileId: const Uuid().v4(),
              filePath: params.logo!);
        }

        // params.photos?.forEach((photo) async {
        //   final photoUrl = await firebaseStorage.uploadFile(
        //     storagePath: '/${params.name}',
        //     fileId: const Uuid().v4(),
        //     filePath: photo,
        //   );
        //   photos.add(photoUrl);
        // });

        final businessModel = BusinessModel(
          name: params.name,
          emblem: emblem,
          logo: logo,
          contactModel: ContactModel(
            address: params.address,
            phone: params.phone,
            email: params.email,
            
          ),
        );

        return customRealTimeDatabaseSource.setItem(businessModel);
      });
}
