import 'package:flutter/material.dart';
import 'package:properties/resource/app_dimen.dart';

class OutlineButtonEx extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle style;
  final Color outlineColor;

  const OutlineButtonEx({
    Key? key,
    required this.text,
    required this.style,
    required this.outlineColor,
    this.onPressed,
  }) : super(key: key);

  @override
  State<OutlineButtonEx> createState() => _OutlineButtonExState();
}

class _OutlineButtonExState extends State<OutlineButtonEx> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.chatsCornerRadius),
        
        ),
        side: BorderSide(color: widget.outlineColor)
      ),
      onPressed: widget.onPressed,
      child: Text(widget.text,style: widget.style,),
    );
  }
}
