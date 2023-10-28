import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/all_dogs_by_breed/bloc/all_dogs_by_breed_cubit.dart';
import '../../features/all_dogs_by_breed/pages/all_dogs_by_breed.dart';
import '../../features/all_dogs_by_breed_subbreed/bloc/all_dogs_by_breed_subbreed_cubit.dart';
import '../../features/all_dogs_by_breed_subbreed/pages/all_dogs_by_breed_subbreed.dart';
import '../../features/dog_by_breed/bloc/dog_by_breed_cubit.dart';
import '../../features/dog_by_breed/pages/dog_by_breed.dart';
import '../../features/dog_by_breed_subbreed/bloc/dog_by_breed_subbreed_cubit.dart';
import '../../features/dog_by_breed_subbreed/pages/dog_by_breed_subbreed.dart';
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
  TypedGoRoute<AllDogsByBreedScreenRoute>(path: 'all-by-breed', name: 'allByBreed'),
  TypedGoRoute<DogByBreedSubBreedScreenRoute>(path: 'by-breed-subbreed', name: 'byBreedSubBreed'),
  TypedGoRoute<AllDogsByBreedSubBreedScreenRoute>(
    path: 'all-by-breed-subbreed',
    name: 'allByBreedSubBreed',
  ),
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
    return BlocProvider<DobByBreedCubit>(
      create: (context) => context.injector()..getBreeds(),
      child: const DogByBreedPage(),
    );
  }
}

class AllDogsByBreedScreenRoute extends GoRouteData {
  const AllDogsByBreedScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<AllDogsByBreedCubit>(
      create: (context) => context.injector()..getBreeds(),
      child: const AllDogsByBreedPage(),
    );
  }
}

class DogByBreedSubBreedScreenRoute extends GoRouteData {
  const DogByBreedSubBreedScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<DogByBreedSubBreedCubit>(
      create: (context) => context.injector()..getBreeds(),
      child: const DogByBreedSubBreedPage(),
    );
  }
}

class AllDogsByBreedSubBreedScreenRoute extends GoRouteData {
  const AllDogsByBreedSubBreedScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<AllDogsByBreedSubBreedCubit>(
      create: (context) => context.injector()..getBreeds(),
      child: const AllDogsByBreedSubBreedPage(),
    );
  }
}
