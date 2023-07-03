import '../extension/extensions.dart';
import 'package:flutter/material.dart';

class AppDropFieldEx extends StatefulWidget {
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

  const AppDropFieldEx({
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
  State<AppDropFieldEx> createState() => _AppDropFieldExState();
}

class _AppDropFieldExState extends State<AppDropFieldEx> {
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
    return Container(
      height: 50.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      // height: 60.0,

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
          labelText: widget.hint,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 8.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 8.0,
          ),
          hintText: widget.hint,
          suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
        ),
      ),
    );
  }
}
