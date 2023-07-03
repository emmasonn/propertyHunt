import 'package:flutter/material.dart';

class ImagePreviewDialog extends StatelessWidget {
  final String imagePath;
  const ImagePreviewDialog({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: const CircleAvatar(
              radius: 24.0,
              backgroundColor: Colors.white,
              child: Icon(Icons.close),
            ),
            onTap: () => Navigator.pop(context),
          ),

          //* Vertical Spacer
          const SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: NetworkImage(imagePath),
            ),
          ),
        ],
      ),
    );
  }
}
