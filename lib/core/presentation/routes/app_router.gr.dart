// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:template/app_update/domain/app_update_status_model.dart' as _i9;
import 'package:template/app_update/presentation/widget/app_update_dialog.dart'
    as _i1;
import 'package:template/Features/auth/presentation/sign_in_page.dart' as _i4;
import 'package:template/Features/notifications/presentation/notifications_page.dart'
    as _i2;
import 'package:template/Features/postes/presentation/list_postes.dart' as _i3;
import 'package:template/Features/splash/splash_page.dart' as _i5;
import 'package:template/Features/user/presentation/user_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AppUpdateRequiredRoute.name: (routeData) {
      final args = routeData.argsAs<AppUpdateRequiredRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppUpdateRequiredPage(
          key: args.key,
          appUpdateStatusModel: args.appUpdateStatusModel,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.NotificationsPage(),
      );
    },
    PostsListScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PostsListScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
    UserRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UserPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppUpdateRequiredPage]
class AppUpdateRequiredRoute
    extends _i7.PageRouteInfo<AppUpdateRequiredRouteArgs> {
  AppUpdateRequiredRoute({
    _i8.Key? key,
    required _i9.AppUpdateStatusModel appUpdateStatusModel,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AppUpdateRequiredRoute.name,
          args: AppUpdateRequiredRouteArgs(
            key: key,
            appUpdateStatusModel: appUpdateStatusModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AppUpdateRequiredRoute';

  static const _i7.PageInfo<AppUpdateRequiredRouteArgs> page =
      _i7.PageInfo<AppUpdateRequiredRouteArgs>(name);
}

class AppUpdateRequiredRouteArgs {
  const AppUpdateRequiredRouteArgs({
    this.key,
    required this.appUpdateStatusModel,
  });

  final _i8.Key? key;

  final _i9.AppUpdateStatusModel appUpdateStatusModel;

  @override
  String toString() {
    return 'AppUpdateRequiredRouteArgs{key: $key, appUpdateStatusModel: $appUpdateStatusModel}';
  }
}

/// generated route for
/// [_i2.NotificationsPage]
class NotificationsRoute extends _i7.PageRouteInfo<void> {
  const NotificationsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PostsListScreen]
class PostsListScreen extends _i7.PageRouteInfo<void> {
  const PostsListScreen({List<_i7.PageRouteInfo>? children})
      : super(
          PostsListScreen.name,
          initialChildren: children,
        );

  static const String name = 'PostsListScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UserPage]
class UserRoute extends _i7.PageRouteInfo<void> {
  const UserRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
