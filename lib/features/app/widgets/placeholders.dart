import 'package:flutter/material.dart';
import 'package:properties/resource/app_dimen.dart';

class BannerPlaceHolder extends StatelessWidget {
  const BannerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(AppDimen.chatsCornerRadius),
      ),
      height: 200,
    );
  }
}

class TitlePlaceHolder extends StatelessWidget {
  const TitlePlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey,
      ),
      height: 12,
    );
  }
}
