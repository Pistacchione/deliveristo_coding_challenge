// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashScreenRoute,
      $homeScreenRoute,
    ];

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/splash',
      name: 'splash',
      factory: $SplashScreenRouteExtension._fromState,
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      const SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeScreenRoute => GoRouteData.$route(
      path: '/home',
      name: 'home',
      factory: $HomeScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'by-breed',
          name: 'byBreed',
          factory: $DogByBreedScreenRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'all-by-breed',
          name: 'allByBreed',
          factory: $AllDogsByBreedScreenRouteExtension._fromState,
        ),
      ],
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) =>
      const HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DogByBreedScreenRouteExtension on DogByBreedScreenRoute {
  static DogByBreedScreenRoute _fromState(GoRouterState state) =>
      const DogByBreedScreenRoute();

  String get location => GoRouteData.$location(
        '/home/by-breed',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AllDogsByBreedScreenRouteExtension on AllDogsByBreedScreenRoute {
  static AllDogsByBreedScreenRoute _fromState(GoRouterState state) =>
      const AllDogsByBreedScreenRoute();

  String get location => GoRouteData.$location(
        '/home/all-by-breed',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
