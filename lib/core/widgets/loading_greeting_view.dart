import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class LoadingGreetingView extends StatelessWidget {
  const LoadingGreetingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Palette.s200,
      highlightColor: Palette.s100,
      child: Container(
        decoration: BoxDecoration(
          color: Palette.s200,
          borderRadius: BorderRadius.circular(50.0),
        ),
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
      ),
    );
  }
}
