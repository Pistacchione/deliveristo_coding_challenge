import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../../application/usecases/usecase_params.dart';
import '../../application/usecases/usecases.dart';
import '../models/dog_response.dart';
import '../repositories/dog_repository.dart';

class GetAllDogsByBreedUseCase implements FutureUseCase<List<RandomDogResponse>, BreedParams> {
  final DogRepository _repository;

  GetAllDogsByBreedUseCase({required DogRepository repository}) : _repository = repository;

  @override
  TaskEither<Failure, List<RandomDogResponse>> call(BreedParams params) {
    return _repository.getAllDogByBreed(breed: params.breed);
  }
}
