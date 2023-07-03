import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:properties/features/app/pages/dashboard_page.dart';
import 'package:properties/features/app/pages/inspections_page.dart';
import 'package:properties/features/app/pages/property_detail_page.dart';
import 'package:properties/features/app/pages/request_inspection_page.dart';
import 'package:properties/features/app/pages/splash_page.dart';
import 'package:properties/features/auth/pages/login_page.dart';
import 'package:properties/features/auth/pages/otp_verify_page.dart';
import 'package:properties/features/auth/pages/register_page.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/navigation/app_paths.dart';

class AppRoutes {
  //use the screen to process users location
  static final splash = GoRoute(
    path: AppPath.splashPath,
    pageBuilder: (BuildContext context, state) {
      return SplashPage.page(key: state.pageKey);
    },
  );

  static final login = GoRoute(
    path: AppPath.loginPath,
    name: AppPath.loginPath,
    pageBuilder: (context, state) {
      return LoginPage.page(key: state.pageKey);
    },
  );

  static final verifyOtp = GoRoute(
    path: AppPath.verifyOtpPath,
    name: AppPath.verifyOtpPath,
    pageBuilder: (context, state) {
      return VerifyOtpPage.page(key: state.pageKey);
    },
  );

  static final registerUser = GoRoute(
    path: AppPath.registerPath,
    name: AppPath.registerPath,
    pageBuilder: (context, state) {
      return RegisterPage.page(key: state.pageKey);
    },
  );

  static final dashboard = GoRoute(
    path: AppPath.dashboardPath,
    name: AppPath.dashboardPath,
    pageBuilder: (BuildContext context, state) {
      return DashboardPage.page(key: state.pageKey);
    },
    routes: [
      propertyDetail,
    ],
  );

  static final propertyDetail = GoRoute(
    name: AppPath.propertyDetailPath,
    path: AppPath.propertyDetailPath,
    pageBuilder: (BuildContext context, state) {
      //retrieve only id from state
      return PropertyDetailPage.page(
        key: state.pageKey,
        propertyModel: state.extra! as PropertyModel,
      );
    },
    routes: [
      requestInspection,
    ]
  );

  static final requestInspection = GoRoute(
    name: AppPath.requestInspectionPath,
    path: AppPath.requestInspectionPath,
    pageBuilder: (BuildContext context, state) {
      //retrieve only id from state
      return RequestInspectionPage.page(
        key: state.pageKey,
      );
    },
  );

  static final inspections = GoRoute(
    name: AppPath.viewInspectionsPath,
    path: AppPath.viewInspectionsPath,
    pageBuilder: (BuildContext context, state) {
      //retrieve only id from state
      return InspectionsPage.page(
        key: state.pageKey,
      );
    },
  );

// static final settings = GoRoute(
//   path: AppPath.settingPath,
//   name: AppPath.settingPath,
//   pageBuilder: (context, state) {
//     return PageSettings.page(key: state.pageKey);
//   },
// );
}
