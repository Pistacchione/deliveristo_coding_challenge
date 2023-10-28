import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/usecases/usecase_params.dart';
import '../../../commons/models/breed.dart';
import '../../../commons/models/dog_response.dart';
import '../../../commons/usecases/get_breeds_usecase.dart';
import '../domain/usecases/get_all_dogs_by_breed_subbreed_usecase.dart';

part 'all_dogs_by_breed_subbreed_state.dart';

class AllDogsByBreedSubBreedCubit extends Cubit<AllDogsByBreedSubBreedState> {
  final GetBreedsUseCase _getBreedsUseCase;
  final GetAllDogsByBreedSubBreedUseCase _getAllDogsByBreedSubBreedUseCase;
  var _breeds = <Breed>[];

  AllDogsByBreedSubBreedCubit({
    required GetBreedsUseCase getBreedsUseCase,
    required GetAllDogsByBreedSubBreedUseCase getAllDogsByBreedSubBreedUseCase,
  })  : _getBreedsUseCase = getBreedsUseCase,
        _getAllDogsByBreedSubBreedUseCase = getAllDogsByBreedSubBreedUseCase,
        super(AllDogsByBreedSubBreedStateInitial());

  void getBreeds() async {
    emit(AllDogsByBreedSubBreedStateLoading());
    if (_breeds.isNotEmpty) {
      return emit(AllDogsByBreedSubBreedStateListOfBreed(breeds: _breeds));
    }

    final breeds = await _getBreedsUseCase(NoParams()).run();
    breeds.match(
      (failure) => emit(AllDogsByBreedSubBreedStateError(message: failure.message)),
      (breeds) {
        _breeds = breeds.where((breed) => breed.subBreeds.isNotEmpty).toList();
        emit(AllDogsByBreedSubBreedStateListOfBreed(breeds: _breeds));
      },
    );
  }

  void getAllDogsByBreed({String? breed, String? subBreed}) async {
    if (breed != null && subBreed != null) {
      final dogsByBreedSubBreed = await _getAllDogsByBreedSubBreedUseCase(
        BreedSubBreedParams(breed: breed, subBreed: subBreed),
      ).run();
      dogsByBreedSubBreed.match(
        (failure) => emit(AllDogsByBreedSubBreedStateError(message: failure.message)),
        (dogs) => emit(AllDogsByBreedSubBreedStateDogs(breeds: _breeds, dogs: dogs)),
      );
    }
  }
}
