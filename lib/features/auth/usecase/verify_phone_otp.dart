import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/features/auth/repository/auth_repository.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';

class VerifyPhoneOtp extends Usecase<AuthUserModel?, VerifyPhoneOtpParams> {
  final AuthRepository authRepository;
  VerifyPhoneOtp(this.authRepository);

  @override
  Future<Either<Failure, AuthUserModel?>> call(params) {
    return authRepository.verifyPhoneOtp(params);
  }
}

class VerifyPhoneOtpParams extends Equatable {
  final String verificationId;
  final String otpCode;

 const VerifyPhoneOtpParams({
    required this.verificationId,
    required this.otpCode,
  });

  @override
  List<Object?> get props => [
    verificationId,
    otpCode
  ];
}
