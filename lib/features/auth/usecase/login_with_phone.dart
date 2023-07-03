import 'package:equatable/equatable.dart';
import 'package:properties/core/firebase_services/firebase_auth.dart';
import 'package:properties/features/auth/repository/auth_repository.dart';
import '../../../../core/usecase/usecase.dart';

class LoginWithPhone
    extends StreamUsecase<PhoneAuthStatus, LoginWithPhoneParams> {
  final AuthRepository authRepository;
  LoginWithPhone(this.authRepository);

  @override
  Stream<PhoneAuthStatus> call(params) {
    return authRepository.loginWithPhone(params);
  }
}

class LoginWithPhoneParams extends Equatable {
  final String phoneNumber;
  const LoginWithPhoneParams(this.phoneNumber);
  @override
  List<Object?> get props => [
        phoneNumber,
      ];
}
