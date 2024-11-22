// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/src/foundation/key.dart';
import 'package:template/Features/auth/presentation/sign_in_page.dart' as _i3;
import 'package:template/Features/notifications/presentation/notifications_page.dart'
    as _i1;
import 'package:template/Features/postes/presentation/list_postes.dart' as _i2;
import 'package:template/Features/splash/splash_page.dart' as _i4;
import 'package:template/Features/user/presentation/user_page.dart' as _i5;

/// generated route for
/// [_i1.NotificationsPage]
class NotificationsRoute extends _i6.PageRouteInfo<void> {
  const NotificationsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i2.PostsListScreen]
class PostsListScreen extends _i6.PageRouteInfo<void> {
  const PostsListScreen({List<_i6.PageRouteInfo>? children, required ValueKey<String> key})
      : super(
          PostsListScreen.name,
          initialChildren: children,
        );

  static const String name = 'PostsListScreen';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.PostsListScreen();
    },
  );
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignInPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}

/// generated route for
/// [_i5.UserPage]
class UserRoute extends _i6.PageRouteInfo<void> {
  const UserRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.UserPage();
    },
  );
}
