import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String fileName() => kReleaseMode ? '.env.prod' : '.env.dev';
String get baseUrl => "https://freelance.mobileappexpert.dev/v1/";
String get googleMapKey => "XXXXXXX";
String get secureStorageTokensKey => "secureStorageTokensKey";
String get secureStorageUserKey => "secureStorageUserKey";
String get encryptKey => "encrtdyptKey";
int get maxSize => 5392880;
