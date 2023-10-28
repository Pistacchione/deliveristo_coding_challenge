import 'package:fpdart/fpdart.dart';

import '../../../../application/errors/errors.dart';
import '../../../../application/usecases/usecase_params.dart';
import '../../../../application/usecases/usecases.dart';
import '../../../../commons/models/dog_response.dart';
import '../../../../commons/repositories/dog_repository.dart';

class GetRandomDogUseCase implements FutureUseCase<RandomDogResponse, NoParams> {
  final DogRepository _repository;

  GetRandomDogUseCase({required DogRepository repository}) : _repository = repository;

  @override
  TaskEither<Failure, RandomDogResponse> call(NoParams params) {
    return _repository.getRandomDog();
  }
}
