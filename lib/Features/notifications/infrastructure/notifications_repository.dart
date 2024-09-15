import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:template/Features/auth/infrastructure/tokens_storage/tokens_storage.dart';
import 'package:template/Features/notifications/infrastructure/notifications_remote_datasource.dart';
import 'package:template/core/infrastructure/helpers/repository_helper.dart';

class NotificationRepository with RepositoryHelper {
  final NotificationsRemoteDataSource _remoteDataSource;
  // final AppRouter _appRouter;
  final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin _localNotifications;
  final TokensStorage _tokensStorage;

  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
  );

  NotificationRepository(
    this._messaging,
    this._localNotifications,
    this._remoteDataSource,
    this._tokensStorage,
  ) {
    _initialize();
  }

  Future<void> _initialize() async {
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _messaging.requestPermission();

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Set up a listener for incoming messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
      actionNotification(
        message,
        false,
      );
    });

    // Set up a listener for when the app is in the background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Set up a listener for when the app is in the foreground
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
      }

      _showNotification(message);

      actionNotification(message, true);
    });

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _localNotifications.initialize(initializationSettings);

    // Get the token each time the application loads
    final String? token = await _messaging.getToken();
    if (kDebugMode) {
      print("FirebaseMessaging token: $token");
    }
  }

  Future<void> actionNotification(RemoteMessage message, bool route) async {
    Logger().i(message.data);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async =>
      _showNotification(message);

  Future<String> getToken() async {
    final String? token = await _messaging.getToken();
    Logger().i(token);
    return token ?? "No Token";
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.max,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await _localNotifications.show(
      0,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
      payload: message.toString(),
    );
  }

  // This method fetches a list of notifications from the remote data source.
  // It takes two parameters: the type of notifications and the page number.

  // This method updates the token in the remote data source.
  FutureEitherFailureOr<String> updateToken() async {
    // The token is fetched from the local data source.
    final String token = await getToken();

    return handleData(
      _remoteDataSource.updateFcmToken(token),
      // The updated token is returned.
      (_) async {
        return token;
      },
    );
  }
}
