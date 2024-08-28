 
import 'package:freezed_annotation/freezed_annotation.dart';
part "template_test_domain.freezed.dart";

@freezed
class TemplatetestDomain with _$TemplatetestDomain {
const TemplatetestDomain._();
const factory TemplatetestDomain({
required int id,
required String title,})= _TemplatetestDomain;

factory TemplatetestDomain.empty()=> TemplatetestDomain(
id: 0,
title: "",
);
}