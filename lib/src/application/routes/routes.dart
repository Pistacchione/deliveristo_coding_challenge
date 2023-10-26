import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/dog_by_breed/pages/dog_by_breed.dart';
import '../../features/home/pages/home.dart';
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

@TypedGoRoute<HomeScreenRoute>(path: '/home', name: 'home', routes: [
  TypedGoRoute<DogByBreedScreenRoute>(path: 'by-breed', name: 'byBreed'),
])
class HomeScreenRoute extends GoRouteData {
  const HomeScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class DogByBreedScreenRoute extends GoRouteData {
  const DogByBreedScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DogByBreedPage();
  }
}
