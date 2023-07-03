import '../extension/extensions.dart';
import 'package:flutter/material.dart';
import '../helpers/helpers.dart';

class CustomDropdownField extends StatefulWidget {
  final List<String> list;
  final String? text;
  final String? autoCorrect;
  final void Function(String) onchange;
  final TextInputType? inputType;
  final String? hint;
  final IconData? suffix;
  final TextCapitalization? capitalization;
  final Color? themeColor;
  final Color? textColor;

  const CustomDropdownField({
    Key? key,
    this.text,
    this.autoCorrect,
    required this.onchange,
    required this.list,
    this.inputType,
    this.hint,
    this.suffix,
    this.capitalization,
    this.themeColor,
    this.textColor,
  }) : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? value;

  @override
  void initState() {
    super.initState();

    if (widget.text != null) {
      value = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    pp(widget.list);
    return SizedBox(
      height: 60.0,
      child: DropdownButtonFormField<String?>(
        icon: const SizedBox(),
        value: value,
        onChanged: (text) {
          setState(() {
            value = text;
          });

          widget.onchange(text!);
        },
        items: widget.list
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e.capitalizeFirst),
                ))
            .toList(),
        style: TextStyle(color: Colors.grey.shade700, fontSize: 16.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.themeColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            gapPadding: 8.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.themeColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            gapPadding: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.themeColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            gapPadding: 8.0,
          ),
          hintText: widget.hint,
          suffixIcon: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
