part of 'dog_by_breed_cubit.dart';

sealed class DogByBreedState extends Equatable {
  final List<Breed> breeds;

  const DogByBreedState({this.breeds = const []});

  @override
  List<Object?> get props => [List.from(breeds)];
}

class DogByBreedStateInitial extends DogByBreedState {}

class DogByBreedStateLoading extends DogByBreedState {}

class DogByBreedStateListOfBreed extends DogByBreedState {
  const DogByBreedStateListOfBreed({super.breeds});
}

class DogByBreedStateDog extends DogByBreedState {
  final RandomDogResponse dog;

  const DogByBreedStateDog({required this.dog, super.breeds});

  @override
  List<Object?> get props => [List.from(breeds), dog];
}

class DogByBreedStateError extends DogByBreedState {
  final String message;

  const DogByBreedStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
