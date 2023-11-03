import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/providers.dart';
import "../application/template_test_notifire.dart";
import '../application/template_test_states.dart';
import '../infrastructure/template_test_remote_datasource.dart';
import '../infrastructure/template_test_repository.dart';

final templatetestRemoteRepositoryProvider =
    Provider<TemplatetestRemoteDataSource>(
  (ref) => TemplatetestRemoteDataSource(ref.watch(dioProvider)),
);

final templatetestRepository = Provider<TemplatetestRepository>(
  (ref) => TemplatetestRepository(
    ref.watch(templatetestRemoteRepositoryProvider),
  ),
);

final templatetestNotifierProvider =
    StateNotifierProvider<TemplatetestStateNotifier, TemplatetestState>(
  (ref) => TemplatetestStateNotifier(ref.watch(templatetestRepository)),
);
