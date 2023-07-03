import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:properties/core/utils/core_utils.dart';
import 'package:properties/core/utils/enums.dart';
import 'package:properties/core/widgets/loading_icon.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/features/auth/widgets/auth_dialog_widget.dart';
import 'package:properties/features/auth/widgets/content_animation.dart';
import 'package:properties/features/auth/widgets/timer_widget.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/app_paths.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_colors.dart';
import 'package:properties/resource/app_strings.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) {
    return CustomPageTransition<void>(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      duration: const Duration(milliseconds: 500),
      child: const VerifyOtpPage(),
    );
  }

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final appBloc = sl<AppBloc>();
  String? smsCode;
  AuthState authState = AuthState.none;
  String? verificationId;

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
            verifyPhoneOtp,
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
                horizontal: size.width * 0.06,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ContentAnimation(
                    position: 0,
                    itemCount: 2,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: Platform.isAndroid
                                ? 'Waiting to automatically detect an SMS send to\n'
                                : 'Enter the 6-digits code that was send to\n',
                            style: theme.textTheme.labelSmall
                                ?.copyWith(height: 1.5),
                            children: [
                              TextSpan(
                                text: '+2347060345454.\t',
                                style: theme.textTheme.titleSmall,
                              ),
                              TextSpan(
                                text: 'Change number',
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(color: AppColor.kAppColor500),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              )
                            ])),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ContentAnimation(
                    position: 0,
                    itemCount: 2,
                    child: Pinput(
                      length: 6,
                      onChanged: (smsCode) {
                        if (smsCode != null && smsCode.length == 6) {
                          appBloc.add(
                            VerifyOtpEvent(
                              verificationId: verificationId!,
                              smsCode: smsCode,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ContentAnimation(
                    position: 0,
                    itemCount: 2,
                    child: Text(
                      'Enter 6-digits code.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  //vertical spacer
                  const SizedBox(
                    height: 20.0,
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: authState != AuthState.expired
                        ? ContentAnimation(
                            position: 2,
                            itemCount: 3,
                            child: CountDownTimerWidget(
                              onTimeElapsed: () {
                                setState(() {
                                  authState = AuthState.expired;
                                });
                              },
                              time: 60,
                            ),
                          )
                        : ContentAnimation(
                            position: 3,
                            itemCount: 3,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Resend Code',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: AppColor.kAppColor500,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
