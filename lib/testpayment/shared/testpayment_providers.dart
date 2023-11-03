 
     
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/providers.dart';
import "../application/testpayment_notifire.dart";  
import '../application/testpayment_states.dart';
import '../infrastructure/testpayment_remote_datasource.dart';
import '../infrastructure/testpayment_repository.dart';



final testpaymentRemoteRepositoryProvider =
    Provider<TestpaymentRemoteDataSource>(
  (ref) => TestpaymentRemoteDataSource(ref.watch(dioProvider)),
);


final testpaymentRepository = Provider<TestpaymentRepository>(
  (ref) => TestpaymentRepository(
    ref.watch(testpaymentRemoteRepositoryProvider),
  ),
);


final testpaymentNotifierProvider =
    StateNotifierProvider<TestpaymentStateNotifier, TestpaymentState>(
  (ref) => TestpaymentStateNotifier(ref.watch(testpaymentRepository)),
);
