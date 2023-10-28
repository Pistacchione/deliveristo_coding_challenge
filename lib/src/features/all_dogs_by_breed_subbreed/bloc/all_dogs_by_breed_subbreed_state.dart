part of 'all_dogs_by_breed_subbreed_cubit.dart';

sealed class AllDogsByBreedSubBreedState extends Equatable {
  final List<Breed> breeds;

  const AllDogsByBreedSubBreedState({this.breeds = const []});

  @override
  List<Object?> get props => [List.from(breeds)];
}

class AllDogsByBreedSubBreedStateInitial extends AllDogsByBreedSubBreedState {}

class AllDogsByBreedSubBreedStateLoading extends AllDogsByBreedSubBreedState {}

class AllDogsByBreedSubBreedStateListOfBreed extends AllDogsByBreedSubBreedState {
  const AllDogsByBreedSubBreedStateListOfBreed({super.breeds});
}

class AllDogsByBreedSubBreedStateDogs extends AllDogsByBreedSubBreedState {
  final List<RandomDogResponse> dogs;

  const AllDogsByBreedSubBreedStateDogs({required this.dogs, super.breeds});

  @override
  List<Object?> get props => [List.from(breeds), List.from(dogs)];
}

class AllDogsByBreedSubBreedStateError extends AllDogsByBreedSubBreedState {
  final String message;

  const AllDogsByBreedSubBreedStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
