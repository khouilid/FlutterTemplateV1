/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsLanguagesGen get languages => const $AssetsIconsLanguagesGen();
}

class $AssetsIconsLanguagesGen {
  const $AssetsIconsLanguagesGen();

  /// File path: assets/icons/languages/english.svg
  SvgGenImage get english =>
      const SvgGenImage('assets/icons/languages/english.svg');

  /// File path: assets/icons/languages/france.svg
  SvgGenImage get france =>
      const SvgGenImage('assets/icons/languages/france.svg');

  /// File path: assets/icons/languages/germany.svg
  SvgGenImage get germany =>
      const SvgGenImage('assets/icons/languages/germany.svg');

  /// File path: assets/icons/languages/nederlands.svg
  SvgGenImage get nederlands =>
      const SvgGenImage('assets/icons/languages/nederlands.svg');

  /// File path: assets/icons/languages/spain.svg
  SvgGenImage get spain =>
      const SvgGenImage('assets/icons/languages/spain.svg');

  /// List of all assets
  List<SvgGenImage> get values => [english, france, germany, nederlands, spain];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
