 
        
import 'package:freezed_annotation/freezed_annotation.dart';
part "testpayment_states.freezed.dart" ;

@freezed
class TestpaymentState with _$TestpaymentState  
{
const TestpaymentState._(); 
const factory TestpaymentState.loading() = Loading;
const factory TestpaymentState.initial() = Initial;
const factory TestpaymentState.failure() = Failure;
}