import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'core/config/environment.dart';
import 'core/presentation/app_widget.dart';
import 'core/presentation/managers/orientation_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: fileName());

  registerErrorHandlers();

  OrientationManager.setPortrait();

  runApp(const ProviderScope(child: AppWidget()));
}

void registerErrorHandlers() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    Logger().log(Level.debug, details.toString());
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    Logger().log(Level.debug, error);
    return true;
  };
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Text(details.toString()),
      ),
    );
  };
}
