import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../datasources/dog_api.dart';
import '../models/dog_response.dart';
import 'dog_repository.dart';

class DogRepositoryImpl implements DogRepository {
  final DogApi _api;

  DogRepositoryImpl({required DogApi api}) : _api = api;

  @override
  TaskEither<Failure, RandomDogResponse> getRandomDog() {
    return TaskEither.tryCatch(() async {
      final response = await _api.getRandomDog();
      return response;
    }, (error, _) {
      return DataFailure(message: error.toString());
    });
  }
}
