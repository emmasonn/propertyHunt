import '../utils/colors.dart';
import 'confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppYearField extends StatefulWidget {
  final String text;
  final String hint;
  final bool? readOnly;
  final IconData? icon;
  final DateTime first;
  final DateTime last;
  final DateTime initialDate;
  final void Function(DateTime) onChange;
  final TextInputAction action;

  const AppYearField({
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
  State<AppYearField> createState() => _AppYearFieldState();
}

class _AppYearFieldState extends State<AppYearField> {
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
        // boxShadow: [
        //   BoxShadow(
        //     spreadRadius: 4,
        //     blurRadius: 4.0,
        //     offset: const Offset(0, 4),
        //     color: Palette.s300.withOpacity(0.5),
        //   ),
        // ],
      ),
      child: TextFormField(
        textInputAction: widget.action,
        controller: controller,
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
            borderRadius: BorderRadius.circular(50),
            gapPadding: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
            gapPadding: 8.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
            gapPadding: 8.0,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 8.0,
          ),
        ),
        onTap: () async {
          final date = await showCustomDialog(
            context,
            Align(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 400.0,
                child: Material(
                  child: YearPicker(
                    initialDate: widget.initialDate,
                    selectedDate: widget.initialDate,
                    firstDate: widget.first,
                    lastDate: widget.last,
                    onChanged: (date) {
                      Navigator.pop(context, date);
                    },
                  ),
                ),
              ),
            ),
            dismissible: true,
          );

          if (date != null) {
            widget.onChange(date);
            controller.text = date.year.toString();
          }
        },
        onChanged: (text) {},
      ),
    );
  }
}
