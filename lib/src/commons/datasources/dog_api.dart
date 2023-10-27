import '../models/breed.dart';
import '../models/dog_response.dart';

abstract class DogApi {
  Future<RandomDogResponse> getRandomDog();
  Future<RandomDogResponse> getDogByBreed({required String breed});
  Future<List<Breed>> getBreeds();
}
