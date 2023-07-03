import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? text;
  final String? autoCorrect;
  final void Function(String)? onchange;
  final TextInputType? inputType;
  final String? hint;
  final IconData? prefix;
  final IconData? suffix;
  final TextCapitalization? capitalization;
  final Color? themeColor;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? padding;
  final bool? autoFocus;
  final bool? readOnly;
  final TextInputAction? action;

  const CustomTextField({
    Key? key,
    this.text,
    this.autoCorrect,
    this.onchange,
    this.inputType,
    this.readOnly,
    this.hint,
    this.prefix,
    this.suffix,
    this.capitalization,
    this.themeColor,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.autoFocus,
    this.action,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.text != null) {
      controller.text = widget.text!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: widget.onchange,
      autofocus: widget.autoFocus ?? false,
      readOnly: widget.readOnly ?? false,
      textInputAction: widget.action ?? TextInputAction.done,
      style: TextStyle(
        color: widget.textColor ?? Colors.grey.shade700,
      ),
      cursorColor: widget.themeColor ?? Colors.grey,
      textCapitalization: widget.capitalization ?? TextCapitalization.none,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        fillColor: widget.backgroundColor ?? Colors.transparent,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: widget.padding ?? 16.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.themeColor ?? Colors.grey),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          gapPadding: 8.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.themeColor ?? Colors.grey),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          gapPadding: 8.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.themeColor ?? Colors.grey),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          gapPadding: 8.0,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
            color: widget.textColor != null
                ? widget.textColor!.withOpacity(0.5)
                : Colors.grey),
        prefixIcon: widget.prefix != null
            ? Icon(
                widget.prefix,
                size: 18.0,
                color: widget.themeColor ?? Colors.grey,
              )
            : null,
        suffixIcon: widget.suffix != null
            ? Icon(
                widget.suffix,
                size: 18.0,
                color: widget.themeColor ?? Colors.grey,
              )
            : null,
      ),
    );
  }
}
