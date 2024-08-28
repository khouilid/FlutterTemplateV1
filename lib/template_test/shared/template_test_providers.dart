 
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/providers.dart';
import "../application/template_test_notifier.dart";  
import '../application/template_test_states.dart';
import '../domain/template_test_domain.dart';
import '../infrastructure/remote/template_test_remote_datasource.dart';
import '../infrastructure/repository/template_test_repository.dart';

final templatetestRemoteRepositoryProvider =
    Provider<TemplatetestRemoteDataSource>(
  (ref) => TemplatetestRemoteDataSource(ref.watch(dioProvider)),
);

final templatetestRepositoryProvider = Provider<TemplatetestRepository>(
  (ref) => TemplatetestRepository(
    ref.watch(templatetestRemoteRepositoryProvider),
  ),
);

final templatetestNotifierProvider =
    StateNotifierProvider<TemplatetestStateNotifier, TemplatetestState>(
  (ref) => TemplatetestStateNotifier(ref.watch(templatetestRepositoryProvider)),
);


final listTemplatetestProvider =
    StateProvider<List<TemplatetestDomain>>((ref) => []);

final selectedTemplatetestProvider =
   StateProvider<TemplatetestDomain>((ref) => TemplatetestDomain.empty());



