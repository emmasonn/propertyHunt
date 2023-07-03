import '../utils/colors.dart';
import 'package:flutter/material.dart';

class AppDropField extends StatefulWidget {
  final String? text;
  final String hint;
  final IconData? icon;
  final void Function(String) onChange;
  final List<String> list;
  final List<String>? subText;
  final bool? loading;
  final Color? color;

  const AppDropField({
    Key? key,
    required this.text,
    required this.hint,
    required this.list,
    this.subText,
    this.loading,
    this.color,
    required this.onChange,
    this.icon,
  }) : super(key: key);

  @override
  State<AppDropField> createState() => _AppDropFieldState();
}

class _AppDropFieldState extends State<AppDropField> {
  String? value;

  @override
  void initState() {
    super.initState();

    value = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: DropdownButtonFormField<String>(
        value: value ?? widget.text,
        isExpanded: true,
        itemHeight: null,
        selectedItemBuilder: (context) => widget.list
            .map((e) => Text(
                  e,
                  softWrap: false,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13.0,
                  ),
                ))
            .toList(),
        items: List.generate(
          widget.list.length,
          (index) => DropdownMenuItem<String>(
            value: widget.list[index],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.list[index],
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13.0,
                  ),
                ),
                widget.subText != null &&
                        widget.subText!.length == widget.list.length
                    ? Text(
                        widget.subText![index],
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 11.0,
                        ),
                      )
                    : const SizedBox(),
                const Divider()
              ],
            ),
          ),
        ),
        style: const TextStyle(height: 1.4, fontSize: 16.0),
        decoration: InputDecoration(
          labelText: widget.hint,
          hintText: widget.hint,
          hintStyle: const TextStyle(height: 1.0, fontSize: 16.0),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 12.0,
          ),
          prefixIcon: widget.loading != null && widget.loading!
              ? const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox.square(
                      dimension: 15.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                  ),
                )
              : widget.icon != null
                  ? Icon(
                      widget.icon,
                      size: 18.0,
                    )
                  : null,
          fillColor: Palette.s50,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (text) {
          widget.onChange(text!);
        },
      ),
    );
  }
}
