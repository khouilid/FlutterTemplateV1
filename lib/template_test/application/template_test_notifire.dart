import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../infrastructure/template_test_repository.dart';
import "template_test_states.dart";

class TemplatetestStateNotifier extends StateNotifier<TemplatetestState> {
  final TemplatetestRepository _templatetestRepository;

  TemplatetestStateNotifier(this._templatetestRepository)
      : super(const TemplatetestState.initial());
}
