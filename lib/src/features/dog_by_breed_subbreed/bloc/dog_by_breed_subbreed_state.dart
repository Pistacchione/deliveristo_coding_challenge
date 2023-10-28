part of 'dog_by_breed_subbreed_cubit.dart';

sealed class DogByBreedSubBreedState extends Equatable {
  final List<Breed> breeds;

  const DogByBreedSubBreedState({this.breeds = const []});

  @override
  List<Object?> get props => [List.from(breeds)];
}

class DogByBreedSubBreedStateInitial extends DogByBreedSubBreedState {}

class DogByBreedSubBreedStateLoading extends DogByBreedSubBreedState {}

class DogByBreedSubBreedStateListOfBreedSubBreed extends DogByBreedSubBreedState {
  const DogByBreedSubBreedStateListOfBreedSubBreed({super.breeds});
}

class DogByBreedSubBreedStateDog extends DogByBreedSubBreedState {
  final RandomDogResponse dog;

  const DogByBreedSubBreedStateDog({required this.dog, super.breeds});

  @override
  List<Object?> get props => [List.from(breeds), dog];
}

class DogByBreedSubBreedStateError extends DogByBreedSubBreedState {
  final String message;

  const DogByBreedSubBreedStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
