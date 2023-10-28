import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/usecases/usecase_params.dart';
import '../../../commons/models/breed.dart';
import '../../../commons/models/dog_response.dart';
import '../../../commons/usecases/get_breeds_usecase.dart';
import '../domain/usecases/get_all_dogs_by_breed.dart';

part 'all_dogs_by_breed_state.dart';

class AllDogsByBreedCubit extends Cubit<AllDogsByBreedState> {
  final GetBreedsUseCase _getBreedsUseCase;
  final GetAllDogsByBreedUseCase _getAllDogsByBreedUseCase;
  var _breeds = <Breed>[];

  AllDogsByBreedCubit({
    required GetBreedsUseCase getBreedsUseCase,
    required GetAllDogsByBreedUseCase getAllDogsByBreedUseCase,
  })  : _getBreedsUseCase = getBreedsUseCase,
        _getAllDogsByBreedUseCase = getAllDogsByBreedUseCase,
        super(AllDogsByBreedStateInitial());

  void getBreeds() async {
    emit(AllDogsByBreedStateLoading());
    if (_breeds.isNotEmpty) {
      return emit(AllDogsByBreedStateListOfBreed(breeds: _breeds));
    }

    final breeds = await _getBreedsUseCase(NoParams()).run();
    breeds.match(
      (failure) => emit(AllDogsByBreedStateError(message: failure.message)),
      (breeds) {
        _breeds = breeds;
        emit(AllDogsByBreedStateListOfBreed(breeds: _breeds));
      },
    );
  }

  void getAllDogsByBreed({String? breed}) async {
    if (breed != null) {
      final dogByBreed = await _getAllDogsByBreedUseCase(BreedParams(breed: breed)).run();
      dogByBreed.match(
        (failure) => emit(AllDogsByBreedStateError(message: failure.message)),
        (dogs) => emit(AllDogsByBreedStateDogs(breeds: _breeds, dogs: dogs)),
      );
    }
  }
}
