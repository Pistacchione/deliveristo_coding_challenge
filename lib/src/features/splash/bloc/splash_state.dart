part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashStateInitial extends SplashState {}

class SplashStateLoading extends SplashState {}

class SplashStateDog extends SplashState {
  final RandomDogResponse dog;

  SplashStateDog({required this.dog});

  @override
  List<Object?> get props => [dog];
}

class SplashStateError extends SplashState {
  final String message;

  SplashStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
