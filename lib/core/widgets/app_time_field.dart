import '../helpers/helpers.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTimeField extends StatefulWidget {
  final String text;
  final String hint;
  final IconData? icon;
  final void Function(TimeOfDay) onChange;
  final TextInputAction action;

  const AppTimeField({
    Key? key,
    required this.text,
    required this.hint,
    required this.onChange,
    this.icon,
    required this.action,
  }) : super(key: key);

  @override
  State<AppTimeField> createState() => _AppTimeFieldState();
}

class _AppTimeFieldState extends State<AppTimeField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
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
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (!mounted) return;

          if (time != null) {
            widget.onChange(time);
            String value = time.format(context).toString();
            pp(value);

            controller.text = value;
          }
        },
        onChanged: (text) {},
      ),
    );
  }
}
