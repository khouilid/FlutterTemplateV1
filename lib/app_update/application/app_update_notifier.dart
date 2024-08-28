import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/domain/failure.dart';

import '../domain/app_update_status_model.dart';
import '../infrastructure/app_version_repository.dart';

part 'app_update_notifier.freezed.dart';

@freezed
class AppUpdateState with _$AppUpdateState {
  const AppUpdateState._();

  const factory AppUpdateState.initial() = _Initial;
  const factory AppUpdateState.loading() = _Loading;

  const factory AppUpdateState.failure(Failure failure) = _Failure;
  const factory AppUpdateState.hasAnUpdate(
      AppUpdateStatusModel appUpdateStatusModel) = _HasAnUpdate;
}

class AppUpdateNotifier extends StateNotifier<AppUpdateState> {
  final AppVersionRepository _repository;

  AppUpdateNotifier(this._repository) : super(const AppUpdateState.initial());

  Future<void> checkForUpdate() async {
    state = const AppUpdateState.loading();

    final failureOrSuccess = await _repository.checkForUpdate();

    state = failureOrSuccess.fold(
      (l) => AppUpdateState.failure(l),
      (r) => AppUpdateState.hasAnUpdate(r),
    );
  }
}
