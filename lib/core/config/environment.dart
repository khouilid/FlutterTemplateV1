import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String fileName() => kReleaseMode ? '.env.prod' : '.env.dev';
String get baseUrl => dotenv.env['BASE_URL_DEV']!;
// String get baseUrl => dotenv.env['BASE_URL']!;

String get googleMapKey => dotenv.env['GOOGLE_MAP_KEY']!;
String get encryptKey => dotenv.env['ENCRYPTION_KEY']!;
