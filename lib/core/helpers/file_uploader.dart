import 'package:file_picker/file_picker.dart';

Future<FilePickerResult?> uploadFile() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['jpg', 'jpeg', 'pdf'],
  );

  return result;
}
