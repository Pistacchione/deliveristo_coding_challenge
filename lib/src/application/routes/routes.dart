import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/bloc/splash_cubit.dart';
import '../../features/splash/pages/splash_page.dart';
import '../extensions/buildcontext_extension.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashScreenRoute>(path: '/splash', name: 'splash')
class SplashScreenRoute extends GoRouteData {
  const SplashScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<SplashCubit>(
      create: (context) => context.injector()..getRandomDog(),
      child: const SplashPage(),
    );
  }
}
