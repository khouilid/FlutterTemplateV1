import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_language.freezed.dart';

@freezed
class AppLanguage with _$AppLanguage {
  const AppLanguage._();
  const factory AppLanguage({
    required String title,
    required String languageCode,
    String? flag,
  }) = _AppLanguage;
}
