import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermission() async {
  if (await Permission.contacts.request().isGranted) {
  }

// You can request multiple permissions at once.
  await [
    Permission.location,
    Permission.storage,
    Permission.mediaLibrary,
    Permission.camera,
  ].request();
}
