import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSelectionView extends StatelessWidget {
  final void Function(ImageSource source) onSelection;

  const ImageSourceSelectionView({
    Key? key,
    required this.onSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      height: 400.0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        child: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.orange,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Camera',
                        style: GoogleFonts.montserrat(),
                      ),
                    ],
                  ),
                  onTap: () => onSelection(ImageSource.camera),
                ),
                InkWell(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        radius: 64.0,
                        child: const Icon(
                          Icons.photo_library,
                          color: Colors.orange,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Gallery',
                        style: GoogleFonts.montserrat(),
                      ),
                    ],
                  ),
                  onTap: () => onSelection(ImageSource.gallery),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              width: 240.0,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  elevation: 0.0,
                ),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.montserrat(
                    color: Colors.grey.shade600,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
