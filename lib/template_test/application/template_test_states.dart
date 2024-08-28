 
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/domain/failure.dart';
import '../domain/template_test_domain.dart';
part "template_test_states.freezed.dart";

@freezed
class TemplatetestState with _$TemplatetestState {
  const TemplatetestState._(); 
  const factory TemplatetestState.loading() = _Loading;
  const factory TemplatetestState.initial() = _Initial;
  const factory TemplatetestState.failure() = _Failure;

  const factory TemplatetestState.loadingCreateTemplatetest() = _LoadingCreateTemplatetest;
  const factory TemplatetestState.successCreateTemplatetest(TemplatetestDomain templatetestDomain) = _SuccessCreateTemplatetest;
  const factory TemplatetestState.failureCreateTemplatetest(Failure  failure) = _FailureCreateTemplatetest;

  const factory TemplatetestState.loadingGetAllTemplatetests() = _LoadingGetAllTemplatetests;
  const factory TemplatetestState.successGetAllTemplatetests(List<TemplatetestDomain> templatetestsDomain) = _SuccessGetAllTemplatetests;
  const factory TemplatetestState.failureGetAllTemplatetests(Failure  failure) = _FailureGetAllTemplatetests;

  const factory TemplatetestState.loadingGetTemplatetestById() = _LoadingGetTemplatetestById;
  const factory TemplatetestState.successGetTemplatetestById(TemplatetestDomain templatetestDomain) = _SuccessGetTemplatetestById;
  const factory TemplatetestState.failureGetTemplatetestById(Failure  failure) = _FailureGetTemplatetestById;

  const factory TemplatetestState.loadingUpdateTemplatetest() = _LoadingUpdateTemplatetest;
  const factory TemplatetestState.successUpdateTemplatetest(TemplatetestDomain templatetestDomain) = _SuccessUpdateTemplatetest;
  const factory TemplatetestState.failureUpdateTemplatetest(Failure  failure) = _FailureUpdateTemplatetest;

  const factory TemplatetestState.loadingDeleteTemplatetest() = _LoadingDeleteTemplatetest;
  const factory TemplatetestState.successDeleteTemplatetest() = _SuccessDeleteTemplatetest;
  const factory TemplatetestState.failureDeleteTemplatetest(Failure  failure) = _FailureDeleteTemplatetest;

}