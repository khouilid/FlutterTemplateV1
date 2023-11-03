 

import 'package:hooks_riverpod/hooks_riverpod.dart';
import "testpayment_states.dart";
import '../infrastructure/testpayment_repository.dart';

class TestpaymentStateNotifier extends StateNotifier<TestpaymentState> {

final TestpaymentRepository  _testpaymentRepository;

TestpaymentStateNotifier(this._testpaymentRepository) : super(const TestpaymentState.initial());

        }