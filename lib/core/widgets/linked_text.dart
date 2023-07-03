import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkedText extends StatelessWidget {
  final String text;
  final double width;
  final Icon? icon;
  final bool? alignCenter;
  final void Function()? onTap;

  const LinkedText({
    Key? key,
    required this.text,
    required this.width,
    this.onTap,
    this.alignCenter,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: alignCenter != null && alignCenter!
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shadowColor: Palette.s400.withOpacity(0.5),
                  child: icon ??
                      Icon(
                        FontAwesomeIcons.circleInfo,
                        color: Palette.s500,
                        size: 18.0,
                      ),
                ),
              ),

              //* Horizontal Spacer
              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
