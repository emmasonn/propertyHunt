import 'package:flutter/material.dart';
import 'package:properties/features/app/widgets/placeholders.dart';
import 'package:properties/resource/app_dimen.dart';
import 'package:shimmer/shimmer.dart';

class PropertiesLoading extends StatefulWidget {
  const PropertiesLoading({super.key});

  @override
  State<PropertiesLoading> createState() => _PropertiesLoadingState();
}

class _PropertiesLoadingState extends State<PropertiesLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimen.cardCornerRadius)),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BannerPlaceHolder(),
                SizedBox(
                  height: 5,
                ),
                TitlePlaceHolder()
              ],
            ),
          );
        },
      ),
    );
  }
}
