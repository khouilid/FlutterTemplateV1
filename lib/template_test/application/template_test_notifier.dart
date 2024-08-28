 
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "template_test_states.dart";
import '../infrastructure/repository/template_test_repository.dart';
import '../domain/template_test_domain.dart';

class TemplatetestStateNotifier extends StateNotifier<TemplatetestState> {
final TemplatetestRepository  _templatetestRepository;

TemplatetestStateNotifier(this._templatetestRepository) : super(const TemplatetestState.initial());

// Create Templatetest
Future<void> createTemplatetest(TemplatetestDomain  templatetestDomain) async {
    state = const TemplatetestState.loadingCreateTemplatetest();
    final result = await _templatetestRepository.createTemplatetest(templatetestDomain);
    result.fold(
      (failure) => state = TemplatetestState.failureCreateTemplatetest(failure),
      (success) => state = TemplatetestState.successCreateTemplatetest(success),
    );
}

// Get all Templatetests
Future<void> getAllTemplatetests() async {
    state = const TemplatetestState.loadingGetAllTemplatetests();
    final result = await _templatetestRepository.getAllTemplatetests();
    result.fold(
      (failure) => state = TemplatetestState.failureGetAllTemplatetests(failure),
      (success) => state = TemplatetestState.successGetAllTemplatetests(success),
    );
}

// Get Templatetest by id
Future<void> getTemplatetestById(int id) async {
    state = const TemplatetestState.loadingGetTemplatetestById();
    final result = await _templatetestRepository.getTemplatetestById(id);
    result.fold(
      (failure) => state = TemplatetestState.failureGetTemplatetestById(failure),
      (success) => state = TemplatetestState.successGetTemplatetestById(success),
    );
}

// Update Templatetest
Future<void> updateTemplatetest(TemplatetestDomain  templatetestDomain) async {
    state = const TemplatetestState.loadingUpdateTemplatetest();
    final result = await _templatetestRepository.updateTemplatetest(templatetestDomain);
    result.fold(
      (failure) => state = TemplatetestState.failureUpdateTemplatetest(failure),
      (success) => state = TemplatetestState.successUpdateTemplatetest(success),
    );
}

// Delete Templatetest
Future<void> deleteTemplatetest(int id) async {
    state = const TemplatetestState.loadingDeleteTemplatetest();
    final result = await _templatetestRepository.deleteTemplatetest(id);
    result.fold(
      (failure) => state = TemplatetestState.failureDeleteTemplatetest(failure),
      (success) => state = TemplatetestState.successDeleteTemplatetest(),
    );
}
}