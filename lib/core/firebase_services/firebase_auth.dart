import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:properties/core/errors/exception.dart';
import 'package:properties/core/failures/failure.dart';
import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/core/utils/core_utils.dart';

class CustomFirebaseAuth {
  // check if user has loggedIn
  CustomFirebaseAuth() {
    _firebaseAuth.userChanges().listen((User? firebaseUser) {
      if (firebaseUser != null) {
        user = firebaseUser.toUser();
        //call notifyListener()
      }
    });
  }

  Stream<PhoneAuthStatus>? phoneAuthStream;
  final _phoneAuthStreamController = StreamController<PhoneAuthStatus>();

  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthUserModel? user;


  Future<AuthUserModel?> get currentUser async =>
      _firebaseAuth.currentUser?.toUser();

  Future<AuthUserModel> loginWithApple() {
    throw const ImplemetationError('title', 'message');
  }

  //parameter will contain email and password
  Future<AuthUserModel> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      final userCred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCred.user!.toUser();
      if (user != null) {
        return user!;
      } else {
        throw ServerException('An error occurred, try again');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ServerException('No user found for that email, try Sign up.');
      } else if (e.code == 'wrong-password') {
        throw ServerException('You entered a wrong password.');
      } else {
        throw ServerException(e.toString());
      }
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }

  //parameter with contain email, password, fullname, others
  Future<AuthUserModel> registerWithEmail(String email, String password) async {
    try {
      final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCred.user!.toUser();
      if (user != null) {
        return user!;
      } else {
        throw ServerException('An error occurred, try again');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ServerException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ServerException('The account already exists for that email.');
      } else {
        throw ServerException(e.toString());
      }
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }

  //login  with firebase
  // Future<T> signWithFacebook() {
  //   try{

  //   }
  // }

  /// Invoke to verify otp.
  Future<AuthUserModel?> verifyOTP({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        return userCredential.user?.toUser();
      } else {
        throw Exception('Something went wrong');
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Stream<PhoneAuthStatus> watchPhoneAuthStream(String phoneNumber) async* {
    //call the loginWithPhone
    await loginWithPhone(phoneNumber);
    yield* phoneAuthStream ??= _phoneAuthStreamController.stream;
  }

  Future<void> loginWithPhone(String phoneNumber) async {
    PhoneAuthStatus phoneAuthStatus;
    try {
      _phoneAuthStreamController.sink.add(LoadingAuth()); //add loading to stream
      //call the verify phone number
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Sign the user in (or link) with the auto-generated credential
          final userCredential =
              await _firebaseAuth.signInWithCredential(credential);
          if (userCredential.user != null) {
            phoneAuthStatus =
                VerificationCompleted(userCredential.user?.toUser());
            _phoneAuthStreamController.sink.add(phoneAuthStatus); //verificationController
            _phoneAuthStreamController.close();
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          pp('verification failed');
          phoneAuthStatus = PhoneAuthFailure(error.message);
          _phoneAuthStreamController.sink.add(phoneAuthStatus);
          _phoneAuthStreamController.close();
        },
        codeSent: (String verificationId, int? forceResendingToken)   {
          pp('Code has been sent');

          phoneAuthStatus = CodeSent(
              verificationId: verificationId,
              forceResendingToken: forceResendingToken);
          _phoneAuthStreamController.sink.add(phoneAuthStatus);
          if(!Platform.isAndroid) {
            _phoneAuthStreamController.close();
          }
        },
        codeAutoRetrievalTimeout: (_) {},
      );
      //yield the result
    } on FirebaseAuthException catch (e) {
      log('${e.message}');
       _phoneAuthStreamController.sink.add(PhoneAuthFailure(e.message));
       _phoneAuthStreamController.close();
    }
  }

  //login with google
  Future<AuthUserModel> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCred = await _firebaseAuth.signInWithCredential(credential);
      if (userCred.user != null) {
        user = userCred.user!.toUser();
        return user!;
      } else {
        throw ServerException('Unknown auth error');
      }
    } on FirebaseAuthException catch (e) {
      throw CommonException(e.toString());
    } on Exception catch (e) {
      //ignore: avoid_print
      print('Unexpected loginWithGoogle Exception: $e');
      throw CommonException('Unknown auth error');
    }
  }

  void signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}

//phone auth case
sealed class PhoneAuthStatus {}

class LoadingAuth extends PhoneAuthStatus {}

class CodeSent extends PhoneAuthStatus {
  final String verificationId;
  final int? forceResendingToken;
  CodeSent({
    required this.verificationId,
    this.forceResendingToken,
  });
}

class VerificationCompleted extends PhoneAuthStatus {
  final AuthUserModel? user;
  VerificationCompleted(this.user);
}

class PhoneAuthFailure extends PhoneAuthStatus {
  final String? errorMsg;
  PhoneAuthFailure(this.errorMsg);
}

extension on User {
  AuthUserModel toUser() {
    return AuthUserModel(
      id: uid,
      email: email ?? '',
      photoURL: photoURL ?? '',
    );
  }
}
