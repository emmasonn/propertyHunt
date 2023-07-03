import '../utils/colors.dart';
import 'package:flutter/material.dart';

class CheckboxedText extends StatefulWidget {
  final String text;
  final Widget clickable;
  final double width;
  final bool checked;
  final void Function(bool) onTap;

  const CheckboxedText({
    Key? key,
    required this.text,
    required this.clickable,
    required this.width,
    required this.onTap,
    required this.checked,
  }) : super(key: key);

  @override
  State<CheckboxedText> createState() => _CheckboxedTextState();
}

class _CheckboxedTextState extends State<CheckboxedText> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    isChecked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        setState(() {
          isChecked = isChecked = !isChecked;
        });

        widget.onTap(isChecked);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: widget.width,
          child: Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shadowColor: Palette.s400.withOpacity(0.5),
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });

                      widget.onTap(isChecked);
                    },
                  ),
                ),
              ),

              //* Horizontal Spacer
              const SizedBox(width: 6),

              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),

              //* Horizontal Spacer
              const SizedBox(width: 6),

              Expanded(child: widget.clickable),
            ],
          ),
        ),
      ),
    );
  }
}
