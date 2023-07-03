import 'package:flutter/material.dart';
import 'package:properties/resource/app_dimen.dart';

class FilledButtonEx extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Color backgroundColor;
  final void Function()? onPressed;

  const FilledButtonEx({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.style,
    this.onPressed,
  }) : super(key: key);

  @override
  State<FilledButtonEx> createState() => _FilledButtonExState();
}

class _FilledButtonExState extends State<FilledButtonEx> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: widget.backgroundColor,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.smallCornerRadius),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}
