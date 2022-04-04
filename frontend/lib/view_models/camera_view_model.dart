import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/models/servicesImp/imagePickerSerImp.dart';
import 'package:image_picker/image_picker.dart';

class CameraViewModel extends ChangeNotifier {
  final ImagePickerSerImp _imagePickerSerImp = locator<ImagePickerSerImp>();

  File? _image;

  File? get getImage => _image;

  List<String> information = ['Hey ya', 'ye ya', 'yo ya'];
  List<String> informationTitle = [
    'Multiple Object Detection',
    'Single Road Sign Detection',
    'Optical Character Recognition'
  ];

  int _selectedMode = 0;

  get getInformation => information[_selectedMode];
  get getInformationTitle => informationTitle[_selectedMode];

  get getSelectedIndex => _selectedMode;

  setSelectedMode(int selectedMode) {
    this._selectedMode = selectedMode;
    notifyListeners();
  }

  pickImage(ImageSource source) async {
    final File tempImage = await _imagePickerSerImp.pickImage(source);

    _image = tempImage;
    print('Imaggio:');
    print(_image);

    notifyListeners();
  }

  removeImage() {
    _image = null;

    notifyListeners();
  }
}
