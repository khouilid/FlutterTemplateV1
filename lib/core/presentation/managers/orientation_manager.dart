import 'package:flutter/services.dart';

class OrientationManager {
  // Singleton

  static final OrientationManager _instance = OrientationManager._internal();
  OrientationManager._internal();

  static void setLandscape() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  static void setPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
}
