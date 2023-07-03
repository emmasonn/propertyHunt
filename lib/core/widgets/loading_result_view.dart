import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/colors.dart';

class LoadingResultItemView extends StatefulWidget {
  const LoadingResultItemView({Key? key}) : super(key: key);

  @override
  State<LoadingResultItemView> createState() => _LoadingResultItemViewState();
}

class _LoadingResultItemViewState extends State<LoadingResultItemView> {
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
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Row(
              children: [
                const CircleAvatar(radius: 20.0),

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
          ),

          //* Vertical Spacer
          const SizedBox(height: 10.0),

          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Palette.s300,
              ),
            ),
          ),

          //* Title
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Padding(
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
          ),

          
        ],
      ),
    );
  }
}
