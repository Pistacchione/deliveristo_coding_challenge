import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../datasources/dog_api.dart';
import '../models/breed.dart';
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

  @override
  TaskEither<Failure, RandomDogResponse> getDogByBreed({required String breed}) {
    return TaskEither.tryCatch(() async {
      final response = await _api.getDogByBreed(breed: breed);
      return response;
    }, (error, _) {
      return DataFailure(message: error.toString());
    });
  }

  @override
  TaskEither<Failure, List<Breed>> getBreeds() {
    return TaskEither.tryCatch(() async {
      final response = await _api.getBreeds();
      return response;
    }, (error, _) {
      return DataFailure(message: error.toString());
    });
  }

  @override
  TaskEither<Failure, List<RandomDogResponse>> getAllDogByBreed({required String breed}) {
    return TaskEither.tryCatch(() async {
      final response = await _api.getDogsByBreed(breed: breed);
      return response;
    }, (error, _) {
      return DataFailure(message: error.toString());
    });
  }
}
