import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final String? text;
  final String? autoCorrect;
  final void Function(String)? onchange;
  final TextInputType? inputType;
  final String? hint;
  final IconData? suffix;
  final TextCapitalization? capitalization;
  final Color? themeColor;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? padding;
  final bool? autoFocus;
  final TextInputAction? action;
  final void Function(String) onSearch;

  const CustomSearchField({
    Key? key,
    this.text,
    required this.onSearch,
    this.autoCorrect,
    this.action,
    this.onchange,
    this.inputType,
    this.hint,
    this.suffix,
    this.capitalization,
    this.themeColor,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.autoFocus,
  }) : super(key: key);

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.text != null) {
      controller.text = widget.text!;
    }

    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
      ),
      child: TextFormField(
        onChanged: widget.onchange,
        onFieldSubmitted: (text) => widget.onSearch(text),
        onSaved: (text) => widget.onSearch(text!),
        autofocus: widget.autoFocus ?? false,
        style: TextStyle(
          color: widget.textColor ?? Colors.grey.shade700,
        ),
        textInputAction: widget.action ?? TextInputAction.done,
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
          hintStyle: theme.textTheme.labelLarge,
          suffixIcon: InkWell(
            onTap: () => widget.onSearch(controller.text),
            child: Icon(
              widget.suffix ?? Icons.search,
              size: 24.0,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
