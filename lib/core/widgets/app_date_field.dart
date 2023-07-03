import '../extension/extensions.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDateField extends StatefulWidget {
  final String text;
  final String hint;
  final bool? readOnly;
  final IconData? icon;
  final DateTime first;
  final DateTime last;
  final DateTime initialDate;
  final void Function(DateTime) onChange;
  final TextInputAction action;

  const AppDateField({
    Key? key,
    required this.text,
    required this.hint,
    required this.onChange,
    required this.first,
    required this.last,
    required this.initialDate,
    this.icon,
    this.readOnly,
    required this.action,
  }) : super(key: key);

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextFormField(
        textInputAction: widget.action,
        controller: controller..text = widget.text,
        autocorrect: false,
        readOnly: true,
        style: const TextStyle(height: 1.4, fontSize: 16.0),
        cursorHeight: 20,
        smartDashesType: SmartDashesType.enabled,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(height: 1.0, fontSize: 16.0),
          filled: true,
          prefixIcon: const Icon(
            FontAwesomeIcons.calendar,
            size: 20.0,
          ),
          suffixIcon: const Icon(
            FontAwesomeIcons.circleDot,
            size: 20.0,
          ),
          fillColor: Palette.s50,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
            gapPadding: 8.0,
          ),
        ),
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            lastDate: widget.last,
            firstDate: widget.first,
            initialDate: widget.initialDate,
            initialDatePickerMode: DatePickerMode.day,
          );

          if (date != null) {
            widget.onChange(date);
            controller.text = date.toDateString;
          }
        },
        onChanged: (text) {},
      ),
    );
  }
}
