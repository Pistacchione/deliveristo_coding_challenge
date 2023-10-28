import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../../application/usecases/usecase_params.dart';
import '../../application/usecases/usecases.dart';
import '../models/dog_response.dart';
import '../repositories/dog_repository.dart';

class GetRandomDogByBreedSubBreedUseCase
    implements FutureUseCase<RandomDogResponse, BreedSubBreedParams> {
  final DogRepository _repository;

  GetRandomDogByBreedSubBreedUseCase({required DogRepository repository})
      : _repository = repository;

  @override
  TaskEither<Failure, RandomDogResponse> call(BreedSubBreedParams params) {
    return _repository.getDogByBreedSubBreed(breed: params.breed, subBreed: params.subBreed);
  }
}
