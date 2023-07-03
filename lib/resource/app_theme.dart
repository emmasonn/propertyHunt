import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:properties/resource/app_colors.dart';

/// NAME         SIZE  WEIGHT  SPACING
/// displayLarge    96.0  light   -1.5
/// displayMedium    60.0  light   -0.5
/// displaySmall    48.0  regular  0.0
/// headlineSmall    34.0  regular  0.25
/// titleLarge    24.0  regular  0.0
/// titleMedium    20.0  medium   0.15
/// titleSmall    16.0  regular  0.15
/// bodyLarge    14.0  medium   0.1
/// bodyMedium        16.0  regular  0.5   (bodyText1)
/// bodySmall        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
/// ```

class AppTheme {
  static TextTheme _buildLightTextTheme(TextTheme base) {
    return base
        .copyWith(
          labelSmall: base.labelMedium!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          labelMedium: base.labelMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: base.labelMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: base.bodySmall!.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: base.bodyLarge!.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: base.bodyLarge!.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: base.titleLarge!.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: base.titleLarge!.copyWith(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: base.titleLarge!.copyWith(
            fontSize: 18.0,
          ),
          displaySmall: GoogleFonts.openSans(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: GoogleFonts.openSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          displayLarge: base.displayLarge!.copyWith(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        )
        .apply(
            fontFamily: 'Montserrat',
            bodyColor: Colors.black,
            displayColor: Colors.black);
  }

  static TextTheme _buildDarkTextTheme(TextTheme base) {
    return base
        .copyWith(
          labelSmall: base.labelMedium!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          labelMedium: base.labelMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: base.labelMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: base.bodySmall!.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: base.bodyLarge!.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: base.bodyLarge!.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: base.titleLarge!.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: base.titleLarge!.copyWith(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: base.titleLarge!.copyWith(
            fontSize: 18.0,
          ),
          displaySmall: GoogleFonts.openSans(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: GoogleFonts.openSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          displayLarge: base.displayLarge!.copyWith(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        )
        .apply(
            fontFamily: 'Montserrat',
            bodyColor: Colors.white,
            displayColor: Colors.white);
  }

  static ThemeData light() {
    final ThemeData base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.light,
        primary: AppColor.kAppColor700,
        onPrimary: AppColor.kAppColor50,
        secondary: AppColor.kAppColor900,
        onError: Colors.red,
        surface: Colors.white,
        onSurface: Colors.black,
        background: AppColor.ghostWhite,
        primaryContainer: Colors.white,
        surfaceVariant: Colors.transparent,
      ),
      cardColor: AppColor.ghostWhite,
      scaffoldBackgroundColor: AppColor.ghostWhite,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.blue;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColor.kAppColor700,
        ),
      ),
      dialogBackgroundColor: Colors.white,
      dividerColor: Colors.black12,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColor.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
      ),
      textTheme: _buildLightTextTheme(base.textTheme),
    );
  }

  static ThemeData dark() {
    final ThemeData base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: AppColor.kAppColor700,
        onPrimary: AppColor.kAppColor50,
        secondary: AppColor.kAppColor900,
        surface: Colors.black,
        onSurface: Colors.white,
        onError: Colors.red,
        surfaceVariant: Colors.transparent,
      ),
      scaffoldBackgroundColor: Colors.black,
      dialogBackgroundColor: Colors.black,
      dividerColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColor.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColor.kAppColor700,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
      ),
      textTheme: _buildDarkTextTheme(base.textTheme),
    );
  }
}
