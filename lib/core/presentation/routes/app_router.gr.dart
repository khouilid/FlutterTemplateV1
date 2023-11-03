// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:template/splash/splash_page.dart' as _i1;
import 'package:template/template_test/presentation/template_test_page.dart'
    as _i2;
import 'package:template/testpayment/presentation/testpayment_page.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    TemplatetestRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TemplatetestPage(),
      );
    },
    TestpaymentRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TestpaymentPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TemplatetestPage]
class TemplatetestRoute extends _i4.PageRouteInfo<void> {
  const TemplatetestRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TemplatetestRoute.name,
          initialChildren: children,
        );

  static const String name = 'TemplatetestRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TestpaymentPage]
class TestpaymentRoute extends _i4.PageRouteInfo<void> {
  const TestpaymentRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TestpaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestpaymentRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
