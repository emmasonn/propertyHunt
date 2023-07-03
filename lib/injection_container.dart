import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:properties/core/firebase_services/firebase_auth.dart';
import 'package:properties/core/firebase_services/firebase_storage.dart';
import 'package:properties/core/firebase_services/realtime_database_source.dart';
import 'package:properties/core/network_info/network_info.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/features/app/remote/mock_source.dart';
import 'package:properties/features/app/repository/app_repository.dart';
import 'package:properties/features/app/usecase/cache_user_address.dart';
import 'package:properties/features/auth/repository/auth_repository.dart';
import 'package:properties/features/auth/usecase/login_with_phone.dart';
import 'package:properties/features/auth/usecase/verify_phone_otp.dart';
import 'package:properties/features/business/model/business_model.dart';
import 'package:properties/features/business/repository/business_repository.dart';
import 'package:properties/features/business/usecases/create_business.dart';
import 'package:properties/features/business/usecases/get_paged_businesses.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/features/properties/repository/property_respository.dart';
import 'package:properties/features/properties/usecases/get_paged_properties.dart';
import 'package:properties/features/settings/app/manager/theme_manager.dart';

GetIt sl = GetIt.instance;

Future<void> initSl() async {
  //! Managers
  sl.registerFactory(() => ThemeManager());

  //! Blocs
  sl.registerFactory(() => AppBloc(
        cacheUserAddress: sl(),
        getPagedBusinesses: sl(),
        getPagedProperties: sl(),
        createBusiness: sl(),
        verifyPhoneOtp: sl(),
        loginWithPhone: sl(),
      ));

  //!usecases
  sl.registerLazySingleton(() => CacheUserAddress(sl()));
  sl.registerLazySingleton(() => GetPagedBusinesses(sl()));
  sl.registerLazySingleton(() => GetPagedProperties(sl()));
  sl.registerLazySingleton(() => CreateBusiness(sl()));
  sl.registerLazySingleton(() => VerifyPhoneOtp(sl()));
  sl.registerLazySingleton(() => LoginWithPhone(sl()));

  //!Repositories
  //* app repository
  sl.registerLazySingleton<AppRepository>(
      () => AppRepository(networkInfo: sl(),));

  //* property repository
  sl.registerLazySingleton<PropertyRepository>(() => PropertyRepository(
      customRealTimeDatabaseSource: sl(), networkInfo: sl()));

  //* auth repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(
        networkInfo: sl(),
        customFirebaseAuth: sl(),
      ));

  //* business repository
  sl.registerLazySingleton<BusinessRepository>(
    () => BusinessRepository(
        customRealTimeDatabaseSource: sl(),
        firebaseStorage: sl(),
        networkInfo: sl()),
  );

  //!Remote Source
  //*properties remote soure
  sl.registerLazySingleton<CustomRealTimeDatabaseSource<PropertyModel>>(
      () => CustomRealTimeDatabaseSource(
            referenceName: 'properties',
            fromJson: PropertyModel.fromMap,
            toJson: (PropertyModel obj) => obj.toJson,
          ));
  //* businesses remote source
  sl.registerLazySingleton<CustomRealTimeDatabaseSource<BusinessModel>>(() =>
      CustomRealTimeDatabaseSource(
          referenceName: 'business',
          fromJson: BusinessModel.fromMap,
          toJson: (BusinessModel model) => model.toJson));

  //* Firebase auth
  sl.registerLazySingleton<CustomFirebaseAuth>(() => CustomFirebaseAuth());

  //*Firebase Storage
  sl.registerLazySingleton(() => CustomFirebaseStorage());

  //*Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<MockSource>(() => MockSource());

  //*External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
