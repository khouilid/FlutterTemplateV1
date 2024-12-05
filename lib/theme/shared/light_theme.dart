import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const buttonColor = Color(0xff3EBF1B);
const redColor = Color(0xffE31C1C);
const menuButtonColor = Color(0xFF272E3F);
const _primary = Color(0xFF272E3F);
const buttonBackgroundColor = Color(0xFF272E3F);
const buttonContentColor = Color(0xff2B098E);

const bluePrimaryColor = Color(0xFF40A7E3);

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: _primary,
    primaryContainer: Color(0xff6a438e),
    secondary: bluePrimaryColor,
    secondaryContainer: Color(0xffffb667),
    tertiary: buttonColor,
    tertiaryContainer: Color(0xfff6f7f9),
    appBarColor: Color(0xffffb667),
    error: Color(0xffb00020),

  ),
  surfaceTint: Colors.transparent,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  lightIsWhite: true,
  subThemesData: const FlexSubThemesData(
    textButtonRadius: 5.0,
    elevatedButtonRadius: 5.0,
    outlinedButtonRadius: 5.0,
    toggleButtonsRadius: 5.0,
    inputDecoratorBorderWidth: 1.5,
    inputDecoratorSchemeColor: SchemeColor.onPrimary,
    inputDecoratorRadius: 5.0,
    fabSchemeColor: SchemeColor.primary,
    tooltipWaitDuration: Duration(milliseconds: 1500),
    dialogElevation: 0,
    dialogBackgroundSchemeColor: SchemeColor.onPrimary,
    dialogRadius: 5,
    fabAlwaysCircular: true,
    fabRadius: 100,
  ),
  keyColors: const FlexKeyColors(
    keepPrimary: true,
    keepSecondary: true,
    keepTertiary: true,
    keepPrimaryContainer: true,
    keepSecondaryContainer: true,
    keepTertiaryContainer: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  scaffoldBackground: const Color(0xffF3F5F7),
  fontFamily: "FontFamily.roboto",
  surface: const Color(0xffF3F5F7),
  onPrimary: const Color(0xffF3F5F7),
);
