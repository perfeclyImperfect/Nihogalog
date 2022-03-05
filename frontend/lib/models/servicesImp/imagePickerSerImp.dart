import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerSerImp {
  Future pickImage(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(source: source);

    if (image == null) return;

    final File imageTemporary = File(image.path);

    return imageTemporary;
  }
}
