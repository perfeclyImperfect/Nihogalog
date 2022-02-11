import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> environmentSetup() async {
  await dotenv.load(fileName: '.env.production');
}

class Environment {
  static String get getEnvironmentFilename {
    if (kReleaseMode) {
      return '.env.production';
    }

    return '.env.development';
  }

  static String get baseURL {
    return dotenv.env['API_URL'] ?? 'API URL NOT FOUND';
  }
}
