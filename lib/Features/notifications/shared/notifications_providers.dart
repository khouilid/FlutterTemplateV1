import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/auth/shared/providers.dart';
import 'package:template/core/shared/providers.dart';

import "../application/notifications_notifire.dart";
import '../application/notifications_states.dart';
import '../infrastructure/notifications_remote_datasource.dart';
import '../infrastructure/notifications_repository.dart';

final notificationsRemoteRepositoryProvider =
    Provider<NotificationsRemoteDataSource>(
  (ref) => NotificationsRemoteDataSource(ref.watch(dioProvider)),
);

final firebaseMessagingProvider =
    Provider<FirebaseMessaging>((ref) => FirebaseMessaging.instance);

final flutterLocalNotificationsPluginProvider =
    Provider<FlutterLocalNotificationsPlugin>(
  (ref) => FlutterLocalNotificationsPlugin(),
);
final notificationRepositoryProvider =
    Provider<NotificationRepository>((ref) => NotificationRepository(
          ref.watch(firebaseMessagingProvider),
          ref.watch(flutterLocalNotificationsPluginProvider),
          ref.watch(notificationsRemoteRepositoryProvider),
          ref.watch(secureTokensStorageProvider),
        ));

final notificationsNotifierProvider = StateNotifierProvider.family<
    NotificationsStateNotifier, NotificationsState, WidgetRef>(
  (ref, widgetRef) => NotificationsStateNotifier(
      widgetRef.watch(notificationRepositoryProvider)),
);
