 
import 'package:freezed_annotation/freezed_annotation.dart';
import "../../domain/template_test_domain.dart";
part "template_test_dto.freezed.dart";
part "template_test_dto.g.dart";

@freezed
class TemplatetestDto with _$TemplatetestDto {
const TemplatetestDto._();
const factory TemplatetestDto({
@Default(0) @JsonKey(name: 'id')  int id,
@Default("") @JsonKey(name: 'title')  String title,
})= _TemplatetestDto;

factory TemplatetestDto.fromJson(Map<String, dynamic> json) =>  _$TemplatetestDtoFromJson(json);
factory TemplatetestDto.empty()=> TemplatetestDto(
id: 0,
title: "",
);

  factory TemplatetestDto.fromDomain(TemplatetestDomain templatetestDomain) {
    return TemplatetestDto(
      id: templatetestDomain.id,
      title: templatetestDomain.title,
    ); }

  TemplatetestDomain toDomain() {
    return TemplatetestDomain(
      id: id,
      title: title,
    );}

}