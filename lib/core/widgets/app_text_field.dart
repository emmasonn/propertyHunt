import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppTextField extends StatefulWidget {
  final String text;
  final String hint;
  final bool? readOnly;
  final IconData? icon;
  final bool? isQuantity;
  final double? cornerRadius;
  final TextInputType? inputType;
  final void Function(String) onChange;
  final TextInputAction action;
  final TextCapitalization capitalization;

  const AppTextField({
    Key? key,
    required this.text,
    required this.hint,
    required this.onChange,
    this.cornerRadius,
    this.icon,
    this.readOnly,
    this.inputType,
    this.isQuantity,
    required this.action,
    required this.capitalization,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextFormField(
        textCapitalization: widget.capitalization,
        textInputAction: widget.action,
        keyboardType: widget.inputType ?? TextInputType.text,
        maxLines: 1,
        inputFormatters: (widget.isQuantity != null && widget.isQuantity!)
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        controller: controller..text = widget.text,
        autocorrect: false,
        
        readOnly: widget.readOnly ?? false,
        style: const TextStyle(height: 1.4, fontSize: 16.0),
        cursorHeight: 20,
        smartDashesType: SmartDashesType.enabled,
        decoration: InputDecoration(
          labelText: widget.hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          hintText: widget.hint,
          hintStyle: const TextStyle(height: 1.0, fontSize: 16.0),
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  size: 20.0,
                )
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
        ),
        onChanged: (text) {
          if (widget.isQuantity != null && widget.isQuantity!) {
            controller.text = NumberFormat.decimalPattern().format(
              double.tryParse(text.replaceAll(',', '')) ?? 0.0,
            );

            widget.onChange(text.replaceAll(',', ''));

            //Return cursor to the end
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          } else {
            widget.onChange(text);
          }
          widget.onChange(text);
        },
      ),
    );
  }
}
