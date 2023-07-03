import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:properties/core/utils/strings.dart';

class AppPasswordField extends StatefulWidget {
  final String text;
  final IconData? icon;
  final void Function(String) onChange;
  final TextInputAction action;

  const AppPasswordField({
    Key? key,
    required this.text,
    required this.onChange,
    this.icon,
    required this.action,
  }) : super(key: key);

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  final controller = TextEditingController();
  bool obscurring = true;

  @override
  void initState() {
    super.initState();
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
        obscureText: obscurring,
        controller: controller,
        style: const TextStyle(height: 1.4, fontSize: 16.0),
        smartDashesType: SmartDashesType.enabled,
        obscuringCharacter: '•',
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          hintText: password,
          labelText: password,
          hintStyle: const TextStyle(height: 1.0, fontSize: 16.0),
          filled: true,
          suffixIcon: InkWell(
            onTap: () => setState(() => obscurring = !obscurring),
            child: Icon(
              obscurring
                  ? FontAwesomeIcons.solidEye
                  : FontAwesomeIcons.solidEyeSlash,
              size: 17.0,
            ),
          ),
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  size: 18.0,
                )
              : const Icon(
                  FontAwesomeIcons.solidUser,
                  size: 18.0,
                ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
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
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 8.0,
          ),
        ),
        onChanged: (text) {
          widget.onChange(text);
        },
      ),
    );
  }
}
