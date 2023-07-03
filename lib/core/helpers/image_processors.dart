import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as client;
import 'package:properties/core/utils/enums.dart';
import 'package:properties/core/widgets/loading_icon.dart';
import 'package:properties/resource/app_colors.dart';

ImageProvider getImage(String path) {
  if (path.startsWith('http://') || path.startsWith('https://')) {
    // log('Coming with http: $path');
    return CachedNetworkImageProvider(path);
  } else if (path.contains('assets')) {
    // log('Coming without http: $path');
    return AssetImage(path);
  } else {
    // log('Coming without http: $path');
    return FileImage(File(path));
  }
}

Widget loadCircleImageWidget(String path, {BoxShape? shape}) {
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      shape: shape ?? BoxShape.circle,
    ),
    child: path.isEmpty
        ? const Icon(
            FontAwesomeIcons.user,
            size: 40,
          )
        : getImageWidget(path),
  );
}

Widget getImageWidget(String path) {
  if (path.startsWith('http://') || path.startsWith('https://')) {
    // log('Coming with http: $path');
    return CachedNetworkImage(
      imageUrl: path,
      placeholder: (context, url) => const LoadingIcon(
        color: AppColor.kAppColor300,
      ),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
      fit: BoxFit.cover,
    );
  } else if (path.contains('assets')) {
    // log('Coming without http: $path');
    return Image.asset(path, fit: BoxFit.cover);
  } else {
    // log('Coming without http: $path');
    return Image.file(File(path), fit: BoxFit.cover);
  }
}

// String getImagePath(String path) {
//   if (path.startsWith('http://') || path.startsWith('https://')) {
//     return path;
//   } else {
//     return '$fileUrl$path';
//   }
// }

Future<String?> uploadImage(
  ImageSource source, {
  CropType? type,
}) async {
  final image = await ImagePicker().pickImage(source: source);

  if (image != null) {
    if (type != null) {
      return cropImage(image.path, type: type);
    } else {
      return image.path;
    }
  } else {
    return null;
  }
}

Future<String?> cropImage(String imagePath, {CropType? type}) async {
  // Proocess Aspect Ratio options
  CropAspectRatio fixRatio() {
    switch (type) {
      case CropType.horiz:
        return const CropAspectRatio(ratioX: 4, ratioY: 3);
      case CropType.vertz:
        return const CropAspectRatio(ratioX: 3, ratioY: 4);
      case CropType.square:
        return const CropAspectRatio(ratioX: 1, ratioY: 1);
      default:
        return const CropAspectRatio(ratioX: 1, ratioY: 1);
    }
  }

  final image = await ImageCropper().cropImage(
    sourcePath: imagePath,
    aspectRatio: type != null ? fixRatio() : null,
  );

  if (image != null) {
    return image.path;
  } else {
    return null;
  }
}

//Encode Network Image to Base64String
Future<String> imageToString(String imageUrl) async {
  const String patchUrl = 'https://wowcatholic.s3.amazonaws.com/';

  client.Response response;

  if (imageUrl.startsWith('https://')) {
    response = await client.get(Uri.parse(imageUrl));
  } else {
    response = await client.get(Uri.parse(patchUrl + imageUrl));
  }
  final base64 = base64Encode(response.bodyBytes);

  return base64;
}

///Decodes Images file encoded to Base64String to Image
Uint8List imageFromString(String base64String) {
  return base64Decode(base64String);
}
