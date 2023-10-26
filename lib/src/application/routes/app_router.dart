import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class AppRouter {
  static final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  final _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigationKey,
    initialLocation: const SplashScreenRoute().location,
    routes: $appRoutes,
  );

  GoRouter get router => _router;
}
