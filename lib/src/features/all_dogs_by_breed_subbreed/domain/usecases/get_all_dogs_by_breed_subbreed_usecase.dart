import 'package:fpdart/fpdart.dart';

import '../../../../application/errors/errors.dart';
import '../../../../application/usecases/usecase_params.dart';
import '../../../../application/usecases/usecases.dart';
import '../../../../commons/models/dog_response.dart';
import '../../../../commons/repositories/dog_repository.dart';

class GetAllDogsByBreedSubBreedUseCase
    implements FutureUseCase<List<RandomDogResponse>, BreedSubBreedParams> {
  final DogRepository _repository;

  GetAllDogsByBreedSubBreedUseCase({required DogRepository repository}) : _repository = repository;

  @override
  TaskEither<Failure, List<RandomDogResponse>> call(BreedSubBreedParams params) {
    return _repository.getAllDogsByBreedSubBreed(breed: params.breed, subBreed: params.subBreed);
  }
}
