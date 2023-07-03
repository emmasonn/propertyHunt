import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../location_service/location.dart';
import '../location_service/location_provider.dart';
import 'custom_loader.dart';

class CustomLocationField extends StatefulWidget {
  final String? text;
  final String? autoCorrect;
  final void Function(Location)? onchange;
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

  const CustomLocationField({
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
  State<CustomLocationField> createState() => _CustomLocationFieldState();
}

class _CustomLocationFieldState extends State<CustomLocationField> {
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
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
      ),
      child: TypeAheadFormField<Location>(
        noItemsFoundBuilder: (context) {
          return const SizedBox(
            height: 80.0,
            child: Center(
              child: Align(
                child: SizedBox(
                  height: 15.0,
                  width: 15.0,
                  child: CustomLoader(message: ''),
                ),
              ),
            ),
          );
        },
        textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          autofocus: widget.autoFocus ?? false,
          textInputAction: widget.action ?? TextInputAction.done,
          style: TextStyle(
            color: widget.textColor ?? Colors.grey.shade700,
          ),
          cursorColor: widget.themeColor ?? Colors.grey,
          textCapitalization: widget.capitalization ?? TextCapitalization.none,
          keyboardType: widget.inputType ?? TextInputType.name,
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
        ),
        suggestionsCallback: (pattern) async {
          return await LocationProvider.fetchLocationsByCity(controller.text);
        },
        itemBuilder: (context, location) {
          return ListTile(
            leading: const Icon(Icons.location_pin),
            title: Text(
              '${location.city}, ${location.country}',
              style: const TextStyle(fontSize: 16.0),
            ),
            subtitle: Text(location.country),
          );
        },
        onSuggestionSelected: (suggestion) {
          widget.onchange!(suggestion);
          controller.text = '${suggestion.city}, ${suggestion.country}';
        },
      ),
    );
  }
}
