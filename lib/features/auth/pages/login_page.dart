import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:properties/core/extension/extensions.dart';
import 'package:properties/core/helpers/helpers.dart';
import 'package:properties/core/utils/enums.dart';
import 'package:properties/core/widgets/app_phone_text_field.dart';
import 'package:properties/core/widgets/loading_icon.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/features/auth/widgets/auth_dialog_widget.dart';
import 'package:properties/features/auth/widgets/content_animation.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/app_paths.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Page page({LocalKey? key}) {
    return CustomPageTransition<void>(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      duration: const Duration(milliseconds: 500),
      child: const LoginPage(),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final appBloc = sl<AppBloc>();

  //*fields
  String? phoneNumber;
  String? countryCode;
  bool emptyField = false;

  //*others
  AuthState authState = AuthState.none;
  AuthState otpStatus = AuthState.none;
  String? smsCode;
  String? verificationId;
  String? forceResendToken;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => appBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            verifyPhone,
          ),
          titleTextStyle: theme.textTheme.titleSmall,
        ),
        body: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            pp(state.runtimeType);
            if (state is PhoneAuthLoading) {
              //show loading dialog
              loadingDialog(context);
            } else if (state is PhoneAuthOtpSent) {
              //pop loading dialog
              Navigator.pop(context);
              verificationId = state.verificationId;
              setState(() {
                authState = AuthState.otpSent;
              });
              //pop loading dialog
              showAppDialog(
                context,
                child: AuthDialogWidget(
                  message: 'PropertyHunt sent an OTP to your device',
                  close: () {
                    //close dialog
                    Navigator.pop(context);
                  },
                ),
              );
            } else if (state is PhoneAuthCompleted) {
              //pop loading dialog
              Navigator.pop(context);

              GoRouter.of(context).push(AppPath.registerPath);
            } else if (state is PhoneAuthError) {
              //pop loading dialog
              showAppDialog(
                context,
                child: AuthDialogWidget(
                  message:
                      state.failure ?? 'Cannot connect to our server try again',
                  close: () {
                    //close dialog
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          child: SafeArea(
            bottom: false,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContentAnimation(
                        position: 0,
                        itemCount: 2,
                        child: Text(
                          verifyPhoneMsg,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ContentAnimation(
                        position: 2,
                        itemCount: 2,
                        child: AppPhoneTextField(
                          hintText: phoneNumberTxt,
                          onChanged: (value) {
                            if (!value.isEmptyOrNull) {
                              final splitPhone = value!.split(' ');
                              final phone = '+$countryCode${splitPhone.join()}';
                              phoneNumber = phone;
                              pp(phoneNumber);
                            }
                          },
                          onCodeSelected: (value) {
                            countryCode = value;
                          },
                        ),
                      ),
                      //show warning for empty phone number
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: emptyField
                            ? Text(
                                emptyPhoneWarning,
                                style: theme.textTheme.labelSmall
                                    ?.copyWith(color: Colors.red),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                  FilledButton(
                    onPressed: () {
                      if (phoneNumber.isEmptyOrNull) {
                        setState(() {
                          emptyField = true;
                        });
                      } else {
                        // appBloc.add(LoginWithPhoneEvent(phoneNumber!));
                        GoRouter.of(context).push(AppPath.verifyOtpPath);
                      }
                    },
                    child: Text(
                      'Next',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
