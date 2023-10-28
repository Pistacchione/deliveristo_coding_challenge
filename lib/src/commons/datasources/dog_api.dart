import '../models/breed.dart';
import '../models/dog_response.dart';

abstract class DogApi {
  Future<RandomDogResponse> getRandomDog();
  Future<RandomDogResponse> getDogByBreed({required String breed});
  Future<RandomDogResponse> getDogByBreedSubBreed({required String breed, required String subBreed});
  Future<List<Breed>> getBreeds();
  Future<List<RandomDogResponse>> getDogsByBreed({required String breed});
}
