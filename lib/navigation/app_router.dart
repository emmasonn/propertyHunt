import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:properties/features/settings/app/manager/theme_manager.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/app_paths.dart';
import 'package:properties/navigation/app_routes.dart';
import 'package:properties/navigation/navigation_transition.dart';

final GoRouter goRouter = GoRouter(
    initialLocation: AppPath.splashPath,
    refreshListenable: sl<ThemeManager>(),
    routes: <RouteBase>[
      AppRoutes.splash,
      AppRoutes.login,
      AppRoutes.dashboard,
      AppRoutes.inspections,
      AppRoutes.verifyOtp,
    ],
    redirect: (context, state) => null,
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      return CustomPageTransition(
        key: state.pageKey,
        child: Container(),
      );
    });
