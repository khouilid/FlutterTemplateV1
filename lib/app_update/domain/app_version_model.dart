
import 'package:freezed_annotation/freezed_annotation.dart';

    part 'app_version_model.freezed.dart';
@freezed

class AppVersionModel with _$AppVersionModel {
  const factory AppVersionModel({
    required String version,
    required int build,
    required bool optional,
    required String platform,
    required String description,
    required String appLink,
    required String appName,

  }) = _AppVersionModel;

  // empty
  factory AppVersionModel.empty() => const AppVersionModel(
        version: "",
        build: 0,
        optional: true,
        platform: "",
        description: "",
        appLink: "",
        appName: "",

      );
}



extension AppVersionX on AppVersionModel {
  bool compareToPreferred(AppVersionModel firebaseAppVersion) {
    // final curr = splitVersion;
    // final upd = firebaseAppVersion.splitVersion;

    // if (curr.length != upd.length || curr.length != 3) return false;

    // for (var i = 0; i < curr.length; i++) {
    //   final currSegment = int.tryParse(curr[i]) ?? 0;
    //   final updSegment = int.tryParse(upd[i]) ?? 0;

    //   if (currSegment < updSegment) return true;
    //   if (updSegment < currSegment) return false;
    // }

    return version != firebaseAppVersion.version;
  }
  // List<String> get splitVersion => version.split('.');
}