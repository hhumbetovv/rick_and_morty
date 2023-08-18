import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/presentation/pages/settings/settings_view.dart';

import '../../constants/routes.dart';
import '../pages/home/home_view.dart';
import '../pages/splash/splash_view.dart';
import 'char_branch.dart';
import 'ep_branch.dart';
import 'loc_branch.dart';

class AppRouter {
  static final _homeNavigatorKey = GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    initialLocation: Routes.splash,
    navigatorKey: _homeNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        parentNavigatorKey: _homeNavigatorKey,
        path: Routes.settings,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                linearTransition: false,
                child: child,
              );
            },
            child: const SettingsView(),
          );
        },
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
