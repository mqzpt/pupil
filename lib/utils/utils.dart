import 'dart:io';

import 'package:image_picker/image_picker.dart';

void pickImage(source, Function(File) imgFile) async {
  ImagePicker imgPicker = ImagePicker();

  XFile? file = await imgPicker.pickImage(source: source);
  if (file == null) return;
  imgFile(File(file.path));
}
