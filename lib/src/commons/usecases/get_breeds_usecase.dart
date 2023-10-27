import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../../application/usecases/usecase_params.dart';
import '../../application/usecases/usecases.dart';
import '../models/breed.dart';
import '../repositories/dog_repository.dart';

class GetBreedsUseCase implements FutureUseCase<List<Breed>, NoParams> {
  final DogRepository _repository;

  GetBreedsUseCase({required DogRepository repository}) : _repository = repository;

  @override
  TaskEither<Failure, List<Breed>> call(NoParams params) {
    return _repository.getBreeds();
  }
}
