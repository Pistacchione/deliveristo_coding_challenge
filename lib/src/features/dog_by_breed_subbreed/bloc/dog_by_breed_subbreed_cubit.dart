import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/usecases/usecase_params.dart';
import '../../../commons/models/breed.dart';
import '../../../commons/models/dog_response.dart';
import '../../../commons/usecases/get_breeds_usecase.dart';
import '../domain/usecases/get_random_dog_by_breed_subbreed_usecase.dart';

part 'dog_by_breed_subbreed_state.dart';

class DogByBreedSubBreedCubit extends Cubit<DogByBreedSubBreedState> {
  final GetBreedsUseCase _getBreedsUseCase;
  final GetRandomDogByBreedSubBreedUseCase _getRandomDogByBreedSubBreedUseCase;
  var _breeds = <Breed>[];

  DogByBreedSubBreedCubit({
    required GetBreedsUseCase getBreedsUseCase,
    required GetRandomDogByBreedSubBreedUseCase getRandomDogByBreedSubBreedUseCase,
  })  : _getBreedsUseCase = getBreedsUseCase,
        _getRandomDogByBreedSubBreedUseCase = getRandomDogByBreedSubBreedUseCase,
        super(DogByBreedSubBreedStateInitial());

  void getBreeds() async {
    emit(DogByBreedSubBreedStateLoading());
    if (_breeds.isNotEmpty) {
      return emit(DogByBreedSubBreedStateListOfBreedSubBreed(breeds: _breeds));
    }

    final breeds = await _getBreedsUseCase(NoParams()).run();
    breeds.match(
      (failure) => emit(DogByBreedSubBreedStateError(message: failure.message)),
      (breeds) {
        _breeds = breeds.where((breed) => breed.subBreeds.isNotEmpty).toList();
        emit(DogByBreedSubBreedStateListOfBreedSubBreed(breeds: _breeds));
      },
    );
  }

  void getDobByBreedSubBreed({String? breed, String? subBreed}) async {
    if (breed != null && subBreed != null) {
      final dogByBreed = await _getRandomDogByBreedSubBreedUseCase(
        BreedSubBreedParams(breed: breed, subBreed: subBreed),
      ).run();
      dogByBreed.match(
        (failure) => emit(DogByBreedSubBreedStateError(message: failure.message)),
        (dog) => emit(DogByBreedSubBreedStateDog(breeds: _breeds, dog: dog)),
      );
    }
  }
}
