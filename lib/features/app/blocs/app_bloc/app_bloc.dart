import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/core/firebase_services/firebase_auth.dart';
import 'package:properties/core/firebase_services/realtime_util.dart';
import 'package:properties/core/usecase/usecase.dart';
import 'package:properties/features/app/usecase/cache_user_address.dart';
import 'package:properties/features/auth/usecase/login_with_phone.dart';
import 'package:properties/features/auth/usecase/verify_phone_otp.dart';
import 'package:properties/features/business/model/business_model.dart';
import 'package:properties/features/business/usecases/create_business.dart';
import 'package:properties/features/business/usecases/get_paged_businesses.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/features/properties/usecases/get_paged_properties.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GetPagedBusinesses getPagedBusinesses;
  final GetPagedProperties getPagedProperties;
  final CreateBusiness createBusiness;
  final LoginWithPhone loginWithPhone;
  final VerifyPhoneOtp verifyPhoneOtp;
  final CacheUserAddress cacheUserAddress;

  AppBloc({
    required this.verifyPhoneOtp,
    required this.loginWithPhone,
    required this.getPagedBusinesses,
    required this.getPagedProperties,
    required this.createBusiness,
    required this.cacheUserAddress,
  }) : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      if (event is CacheAddressEvent) {
        //emit loading state
        emit(CacheUserAddressLoading());
        //make get locaton request
        final result = await cacheUserAddress(NoParams());

        emit(
          result.fold(
            (failure) => CacheUserAddressError(failure),
            (status) => CacheUserAddressLoaded(status),
          ),
        );
      } else if (event is LoginWithPhoneEvent) {
        //call loginwith phone
        final result = loginWithPhone(LoginWithPhoneParams(event.phone));
        //register a listener to the result because it's a stream

        await emit.forEach(result, onData: (event) {
          return switch (event) {
            LoadingAuth() => PhoneAuthLoading(),
            VerificationCompleted() => PhoneAuthCompleted(event.user),
            CodeSent() => PhoneAuthOtpSent(
                verificationId: event.verificationId,
                forceResendToken: event.forceResendingToken),
            PhoneAuthFailure() => PhoneAuthError(event.errorMsg)
          };
        });

        // result.listen((event) {
        //   switch (event) {
        //     case LoadingAuth():
        //       emit(PhoneAuthLoading());
        //     case VerificationCompleted():
        //       emit(PhoneAuthCompleted(event.user));
        //     case CodeSent():
        //       emit(
        //         PhoneAuthOtpSent(
        //           verificationId: event.verificationId,
        //           forceResendToken: event.forceResendingToken,
        //         ),
        //       );
        //     case PhoneAuthFailure():
        //       emit(PhoneAuthError(event.errorMsg));
        //   }
        // });
      } else if (event is VerifyOtpEvent) {
        //emit loading state
        emit(VerifyOtpLoading());
        //running code
        final result = await verifyPhoneOtp(VerifyPhoneOtpParams(
          verificationId: event.verificationId,
          otpCode: event.smsCode,
        ));

        emit(result.fold(
          (failure) => VerifyOtpError(failure.message),
          (authUserModel) => VerifyOtpLoaded(authUserModel),
        ));
      } else if (event is CreateBusinessEvent) {
        emit(CreateBusinessLoading());

        final result = await createBusiness(
          CreateBusinessParams(
            name: event.name,
            address: event.address,
            phone: event.phone,
            email: event.email,
          ),
        );

        emit(
          result.fold((failure) => CreateBusinessError(failure),
              (model) => CreateBusinessLoaded(model)),
        );
      } else if (event is GetPropertiesEvent) {
        emit(GetPropertiesLoading());

        final result = await getPagedProperties(GetPagedPropertiesParams(
          startAfter: event.startAfter,
          endAfter: event.endAfter,
          limitToStart: event.limitToStart,
          orderBy: event.orderBy,
        ));

        emit(
          result.fold((failure) => GetPropertiesError(failure),
              (properties) => GetPropertiesLoaded(properties)),
        );
      } else if (event is GetBusinessesEvent) {
        emit(GetBusinessesLoading());

        final result = await getPagedBusinesses(GetPagedBusinessesParams(
          startAfter: event.startAfter,
          endAfter: event.endAfter,
          limitToStart: event.limitToStart,
          orderBy: event.orderBy,
        ));

        emit(
          result.fold((failure) => GetBusinessesError(failure),
              (businesses) => GetBusinessesLoaded(businesses)),
        );
      }
    });
  }
}
