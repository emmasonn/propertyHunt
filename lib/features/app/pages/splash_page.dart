import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:properties/core/utils/core_utils.dart';
import 'package:properties/core/widgets/loading_icon.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/app_paths.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static Page page({LocalKey? key}) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const SplashPage(),
    );
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final appBloc = sl<AppBloc>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).push(AppPath.dashboardPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appBloc..add(CacheAddressEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            pp(state.runtimeType);
            if (state is CacheUserAddressLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is CacheUserAddressLoaded) {
              setState(() {
                isLoading = false;
              });
              //Navigate to login
              GoRouter.of(context).push(AppPath.dashboardPath);
            } else if (state is CacheUserAddressError) {
              pp(state.failure.message);
              setState(() {
                isLoading = false;
              });
            }
          },
          child: SafeArea(
              bottom: false,
              top: false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/images/estate_icon.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // if (isLoading) ...[
                     const LoadingIcon(
                      color: AppColor.kAppColor500,
                    ),
                    // ]
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
