import 'package:flutter/material.dart';

class Palette {
  static Color s50 = const Color(0xFFECF9EC);
  static Color s100 = const Color(0xFFC6ECC6);
  static Color s200 = const Color(0xFF9FDF9F);
  static Color s300 = const Color(0xFF79D279);
  static Color s400 = const Color(0xFF53C653);
  static Color s500 = const Color(0xFF39AC39);
  static Color s600 = const Color(0xFF2D862D);
  static Color s700 = const Color(0xFF206020);
  static Color s800 = const Color(0xFF133913);
  static Color s900 = const Color(0xFF061306);
}

MaterialColor primarySwatch = MaterialColor(
  Palette.s500.value,
  {
    50: Palette.s50,
    100: Palette.s100,
    200: Palette.s200,
    300: Palette.s300,
    400: Palette.s400,
    500: Palette.s500,
    600: Palette.s600,
    700: Palette.s700,
    800: Palette.s800,
    900: Palette.s900,
  },
);
