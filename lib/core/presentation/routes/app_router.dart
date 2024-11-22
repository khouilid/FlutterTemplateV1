// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/Features/postes/presentation/list_postes.dart';
import 'package:template/Features/splash/splash_page.dart';

class GoRouterSetup {
  // Private navigator key
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: '/spalsh',
    navigatorKey: _navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/spalsh',
        name: 'splash',
        builder: (context, state) {
          return SplashPage(key: state.pageKey);
        },
        routes: [],
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return PostsListScreen();
        },
        routes: [],
      ),
    ],
  );

  static GoRouter get router => _router;
}
