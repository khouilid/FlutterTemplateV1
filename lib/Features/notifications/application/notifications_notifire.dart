import 'package:hooks_riverpod/hooks_riverpod.dart';
import "notifications_states.dart";
import '../infrastructure/notifications_repository.dart';

class NotificationsStateNotifier extends StateNotifier<NotificationsState> {
  final NotificationRepository _notificationsRepository;

  NotificationsStateNotifier(this._notificationsRepository)
      : super(const NotificationsState.initial());

  // update fcm token
  void updateFcmToken() async {
    state = const NotificationsState.loading();
    final result = await _notificationsRepository.updateToken();
    result.fold(
      (failure) => state = NotificationsState.failure(failure),
      (data) => state = const NotificationsState.updateFcmTokenSuccess(),
    );
  }
}
