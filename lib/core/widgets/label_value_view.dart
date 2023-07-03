import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LabelValueView extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget>? actions;

  const LabelValueView({
    Key? key,
    required this.title,
    required this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Card(
        elevation: 0.50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Palette.s400,
                        fontSize: 13.0,
                      ),
                    ),

                    //* Vertical Spacer
                    const SizedBox(height: 6),

                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),

              //* Horizontal Spacer
              const SizedBox(width: 10.0),

              ...actions ?? [].map((e) => e),
            ],
          ),
        ),
      ),
    );
  }
}
