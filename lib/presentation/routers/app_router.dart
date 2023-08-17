import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../pages/home/home_view.dart';
import '../pages/splash/splash_view.dart';
import 'char_branch.dart';
import 'ep_branch.dart';
import 'loc_branch.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    initialLocation: Routes.splash,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return CustomTransitionPage(
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.ease)),
                ),
                child: child,
              );
            },
            child: HomeView(navigationShell: navigationShell),
          );
        },
        branches: [
          CharBranch(),
          LocBranch(),
          EpBranch(),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
