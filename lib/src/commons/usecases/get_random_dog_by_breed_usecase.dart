import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../../application/usecases/usecase_params.dart';
import '../../application/usecases/usecases.dart';
import '../models/dog_response.dart';
import '../repositories/dog_repository.dart';

class GetRandomDogByBreedUseCase implements FutureUseCase<RandomDogResponse, BreedParams> {
  final DogRepository _repository;

  GetRandomDogByBreedUseCase({required DogRepository repository}) : _repository = repository;

  @override
  TaskEither<Failure, RandomDogResponse> call(BreedParams params) {
    return _repository.getDogByBreed(breed: params.breed);
  }
}
