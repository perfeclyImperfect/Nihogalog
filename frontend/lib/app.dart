import 'package:flutter/material.dart';
import 'package:frontend/config/locator/locator.dart';
import 'package:frontend/config/environment.dart';

import 'views/screens/main.dart';

void main() async {
  await environmentSetup();
  getItSetup();
  runApp(const MyApp());
}
