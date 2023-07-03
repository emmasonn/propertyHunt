import 'package:flutter/material.dart';

class AppTextArea extends StatefulWidget {
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
  final int? minLines;
  final int? maxLines;

  const AppTextArea({
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
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  State<AppTextArea> createState() => _AppTextAreaState();
}

class _AppTextAreaState extends State<AppTextArea> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
      ),
      child: TextFormField(
        controller: controller..text = widget.text ?? '',
        onChanged: widget.onchange,
        minLines: widget.minLines ?? 3,
        maxLines: widget.maxLines ?? 4,
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
          labelText: widget.hint,
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: widget.padding ?? 16.0,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            gapPadding: 8.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            gapPadding: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
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
      ),
    );
  }
}
