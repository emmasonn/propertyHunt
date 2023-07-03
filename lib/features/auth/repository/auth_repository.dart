import 'package:dartz/dartz.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/core/firebase_services/firebase_auth.dart';
import 'package:properties/core/firebase_services/firebase_runner.dart';
import 'package:properties/core/network_info/network_info.dart';
import 'package:properties/features/auth/usecase/login_with_phone.dart';
import 'package:properties/features/auth/usecase/verify_phone_otp.dart';

class AuthRepository {
  final NetworkInfo networkInfo;
  final CustomFirebaseAuth customFirebaseAuth;
  AuthRepository({
    required this.networkInfo,
    required this.customFirebaseAuth,
  });

  Future<AuthUserModel?> get getUser => customFirebaseAuth.currentUser;

  //return a stream of phoneAuthStatus
  Stream<PhoneAuthStatus> loginWithPhone(LoginWithPhoneParams params) {
    return customFirebaseAuth.watchPhoneAuthStream(params.phoneNumber);
  }

  //call verify otp function
  Future<Either<Failure, AuthUserModel?>> verifyPhoneOtp(
      VerifyPhoneOtpParams params) {
    return FirebaseRunner<AuthUserModel?>(networkInfo)
        .runNetworkTask(() => customFirebaseAuth.verifyOTP(
              verificationId: params.verificationId,
              smsCode: params.otpCode,
            ));
  }
}
