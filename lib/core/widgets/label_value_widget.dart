import 'package:flutter/material.dart';

class LableValueWidget extends StatelessWidget {
  final String lable;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final void Function()? update;
  final void Function()? view;
  final double? elevation;

  const LableValueWidget({
    Key? key,
    required this.lable,
    required this.value,
    this.labelStyle,
    this.elevation,
    this.valueStyle,
    this.update,
    this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 2.0,
      shadowColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: ListTile(
          title: Text(
            value,
            style: valueStyle ??
                TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                  fontSize: 16.0,
                ),
          ),
          subtitle: Text(
            lable,
            style: labelStyle ??
                const TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
          ),
          trailing: update == null
              ? null
              : InkWell(
                  child: const Icon(
                    Icons.edit,
                    size: 18,
                  ),
                  onTap: () => update!(),
                ),
          onTap: view,
        ),
      ),
    );
  }
}
