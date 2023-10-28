part of 'all_dogs_by_breed_cubit.dart';

sealed class AllDogsByBreedState extends Equatable {
  final List<Breed> breeds;

  const AllDogsByBreedState({this.breeds = const []});

  @override
  List<Object?> get props => [List.from(breeds)];
}

class AllDogsByBreedStateInitial extends AllDogsByBreedState {}

class AllDogsByBreedStateLoading extends AllDogsByBreedState {}

class AllDogsByBreedStateListOfBreed extends AllDogsByBreedState {
  const AllDogsByBreedStateListOfBreed({super.breeds});
}

class AllDogsByBreedStateDogs extends AllDogsByBreedState {
  final List<RandomDogResponse> dogs;

  const AllDogsByBreedStateDogs({required this.dogs, super.breeds});

  @override
  List<Object?> get props => [List.from(breeds), List.from(dogs)];
}

class AllDogsByBreedStateError extends AllDogsByBreedState {
  final String message;

  const AllDogsByBreedStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
