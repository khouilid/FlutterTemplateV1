import 'package:flutter/services.dart';

/// this class help to manage the orientation of the app
/// if you want to set the app to be in landscape mode
/// call the [setLandscape] function
/// if you want to set the app to be in portrait mode
/// call the [setPortrait] function
class OrientationManager {
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
