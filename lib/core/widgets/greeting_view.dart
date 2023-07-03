import '../../../../core/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/strings.dart';

class GreetingView extends StatelessWidget {
  final String name;
  const GreetingView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(50.0),
      ),
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 40.0,
            child: Icon(
              Icons.front_hand,
              size: 22,
            ),
          ),

          //* Horizontal Spacer
          const SizedBox(width: 10.0),

          RichText(
              text: TextSpan(
            text: '$hiThere, ',
            children: [
              TextSpan(
                text: name,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Palette.s700,
            ),
          ))
        ],
      ),
    );
  }
}
