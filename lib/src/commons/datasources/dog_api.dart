import '../models/dog_response.dart';

abstract class DogApi {
  Future<RandomDogResponse> getRandomDog();
  Future<RandomDogResponse> getDogByBreed({required String breed});
}