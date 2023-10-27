import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/usecases/usecase_params.dart';
import '../../../commons/models/breed.dart';
import '../../../commons/models/dog_response.dart';
import '../../../commons/usecases/get_breeds_usecase.dart';
import '../../../commons/usecases/get_random_dog_by_breed_usecase.dart';

part 'dog_by_breed_state.dart';

class DobByBreedCubit extends Cubit<DogByBreedState> {
  final GetBreedsUseCase _getBreedsUseCase;
  final GetRandomDogByBreedUseCase _getRandomDogByBreedUseCase;
  var _breeds = <Breed>[];

  DobByBreedCubit({
    required GetBreedsUseCase getBreedsUseCase,
    required GetRandomDogByBreedUseCase getRandomDogByBreedUseCase,
  })  : _getBreedsUseCase = getBreedsUseCase,
        _getRandomDogByBreedUseCase = getRandomDogByBreedUseCase,
        super(DogByBreedStateInitial());

  void getBreeds() async {
    emit(DogByBreedStateLoading());
    if (_breeds.isNotEmpty) {
      return emit(DogByBreedStateListOfBreed(breeds: _breeds));
    }

    final breeds = await _getBreedsUseCase(NoParams()).run();
    breeds.match(
      (failure) => emit(DogByBreedStateError(message: failure.message)),
      (breeds) {
        _breeds = breeds;
        emit(DogByBreedStateListOfBreed(breeds: _breeds));
      },
    );
  }

  void getDobByBreed({String? breed}) async {
    if (breed != null) {
      final dogByBreed = await _getRandomDogByBreedUseCase(BreedParams(breed: breed)).run();
      dogByBreed.match(
        (failure) => emit(DogByBreedStateError(message: failure.message)),
        (dog) => emit(DogByBreedStateDog(breeds: _breeds, dog: dog)),
      );
    }
  }
}
