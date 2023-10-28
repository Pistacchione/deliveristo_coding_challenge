import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../models/breed.dart';
import '../models/dog_response.dart';

abstract class DogRepository {
  TaskEither<Failure, RandomDogResponse> getRandomDog();
  TaskEither<Failure, RandomDogResponse> getDogByBreed({required String breed});
  TaskEither<Failure, List<Breed>> getBreeds();
  TaskEither<Failure, List<RandomDogResponse>> getAllDogByBreed({required String breed});
  TaskEither<Failure, RandomDogResponse> getDogByBreedSubBreed({
    required String breed,
    required String subBreed,
  });
  TaskEither<Failure, List<RandomDogResponse>> getAllDogsByBreedSubBreed({
    required String breed,
    required String subBreed,
  });
}
