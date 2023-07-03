import 'package:flutter/cupertino.dart';
import 'package:properties/resource/app_dimen.dart';

class CustomAppBar extends PreferredSize {
  const CustomAppBar({
    Key? key,
    required this.child,
    required this.size,
  }) : super(key: key, child: child, preferredSize: size);
  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimen.cardCornerRadius),
      ),
      child: child,
    );
  }
}
