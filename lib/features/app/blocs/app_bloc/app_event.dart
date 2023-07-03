part of 'app_bloc.dart';

//* App Event
class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

//!Get user location
class CacheAddressEvent extends AppEvent {}

//!Authentication event
//LoginWithPhone event
class LoginWithPhoneEvent extends AppEvent {
  final String phone;
  LoginWithPhoneEvent(this.phone);
}

//Verify otp event
class VerifyOtpEvent extends AppEvent {
  final String verificationId;
  final String smsCode;
  VerifyOtpEvent({
    required this.verificationId,
    required this.smsCode,
  });
}

//!other events
//*Get Properties
class GetPropertiesEvent extends AppEvent {
  final FilterSortClause? startAfter;
  final FilterSortClause? endAfter;
  final FilterSortClause equalTo;
  final FilterSortClause limitToStart;
  final FilterSortClause orderBy;
  GetPropertiesEvent({
    required this.equalTo,
    required this.limitToStart,
    this.orderBy = const FilterSortClause.orderByValue(),
    this.endAfter,
    this.startAfter,
  });
}

// //*Get PrevProperties
// class GetPrevPropertiesEvent extends AppEvent {
//   final FilterSortClause? endAfter;
//   final FilterSortClause equalTo;
//   GetPrevPropertiesEvent({
//     required this.equalTo,
//     required this.endAfter,
//   });
// }

//* Get Businesses
class GetBusinessesEvent extends AppEvent {
  final FilterSortClause? startAfter;
  final FilterSortClause? endAfter;
  final FilterSortClause equalTo;
  final FilterSortClause limitToStart;
  final FilterSortClause orderBy;
  GetBusinessesEvent(
      {this.startAfter,
      this.endAfter,
      this.orderBy = const FilterSortClause.orderByValue(),
      required this.equalTo,
      required this.limitToStart});
}

//*Create business
class CreateBusinessEvent extends AppEvent {
  final String name;
  final String? website;
  final String address;
  final String phone;
  final String email;

  CreateBusinessEvent({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    this.website,
  });
}
