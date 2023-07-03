import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPasswordField extends StatefulWidget {
  final String? text;
  final String? autoCorrect;
  final void Function(String)? onchange;
  final TextInputType? inputType;
  final String? hint;
  final Color? color;

  final bool? obscure;

  const CustomPasswordField({
    Key? key,
    this.text,
    this.autoCorrect,
    this.onchange,
    this.inputType,
    this.hint,
    this.obscure,
    this.color,
  }) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  final controller = TextEditingController();
  bool obscuring = true;

  @override
  void initState() {
    super.initState();

    if (widget.text != null) {
      controller.text = widget.text!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: TextFormField(
        onChanged: widget.onchange,
        style: TextStyle(color: widget.color ?? Colors.grey),
        obscureText: obscuring,
        cursorColor: widget.color ?? Colors.grey,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color ?? Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            gapPadding: 8.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color ?? Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            gapPadding: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color ?? Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            gapPadding: 8.0,
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: widget.color != null
                  ? widget.color!.withOpacity(0.5)
                  : Colors.grey),
          suffixIcon: GestureDetector(
            child: Icon(
              obscuring
                  ? FontAwesomeIcons.solidEyeSlash
                  : FontAwesomeIcons.solidEye,
              size: 18,
            ),
            onTap: () {
              setState(() {
                obscuring = !obscuring;
              });
            },
          ),
        ),
      ),
    );
  }
}
