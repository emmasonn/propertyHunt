import 'package:flutter/material.dart';

class EmptyPostItemView extends StatefulWidget {
  const EmptyPostItemView({Key? key}) : super(key: key);

  @override
  State<EmptyPostItemView> createState() => _EmptyPostItemViewState();
}

class _EmptyPostItemViewState extends State<EmptyPostItemView> {
  final double margin = 12.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24.0),
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(
        horizontal: margin,
        vertical: 10.0,
      ),
      child: Column(
        children: [
          //* Post Header
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey.shade300,
              ),

              //* Horizontal Spacer
              const SizedBox(width: 10.0),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('                               '),
                    Text('                    '),
                  ],
                ),
              ),

              const IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: null,
              ),
            ],
          ),

          //* Vertical Spacer
          const SizedBox(height: 10.0),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
            ),
          ),

          //* Title
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 4.0,
            ),
            child: Row(
              children: const [
                Expanded(
                  child: Text('                                        '),
                ),
              ],
            ),
          ),

          //* Post Actions
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                ),

                //* Horizontal Spacer
                const SizedBox(width: 15.0),

                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                ),

                const Spacer(),

                //* Post Type
                Container(
                  height: 30.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
