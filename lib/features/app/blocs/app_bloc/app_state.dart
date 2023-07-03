part of 'app_bloc.dart';

class AppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppInitial extends AppState {}

//! location access
class CacheUserAddressLoading extends AppState {}

class CacheUserAddressLoaded extends AppState {
  final bool status;
  CacheUserAddressLoaded(this.status);
}

class CacheUserAddressError extends AppState {
  final Failure failure;
  CacheUserAddressError(this.failure);
}

//!Authentication state
//phone number auth
class PhoneAuthLoading extends AppState {}

class PhoneAuthCompleted extends AppState {
  final AuthUserModel? authUser;
  PhoneAuthCompleted(this.authUser);
}

class PhoneAuthOtpSent extends AppState {
  final String verificationId;
  final int? forceResendToken;
  PhoneAuthOtpSent({
    required this.verificationId,
    this.forceResendToken,
  });
}

class PhoneAuthError extends AppState {
  final String? failure;
  PhoneAuthError(this.failure);
}

//verify otp
class VerifyOtpLoading extends AppState {}

class VerifyOtpLoaded extends AppState {
  final AuthUserModel? authUserModel;
  VerifyOtpLoaded(this.authUserModel);
}

class VerifyOtpError extends AppState {
  final String failure;
  VerifyOtpError(
    this.failure,
  );
}

//!other state
//* Get properties
class GetPropertiesLoading extends AppState {}

class GetPropertiesLoaded extends AppState {
  final List<PropertyModel> properties;
  GetPropertiesLoaded(this.properties);
}

class GetPropertiesError extends AppState {
  final Failure failure;
  GetPropertiesError(this.failure);
}

//* Get businesses
class GetBusinessesLoading extends AppState {}

class GetBusinessesLoaded extends AppState {
  final List<BusinessModel> businesses;
  GetBusinessesLoaded(this.businesses);
}

class GetBusinessesError extends AppState {
  final Failure failure;
  GetBusinessesError(this.failure);
}

//*Create business
class CreateBusinessLoading extends AppState {}

class CreateBusinessLoaded extends AppState {
  final BusinessModel? model;
  CreateBusinessLoaded(this.model);
}

class CreateBusinessError extends AppState {
  final Failure failure;
  CreateBusinessError(this.failure);
}
