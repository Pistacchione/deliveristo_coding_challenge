import '../models/dog_response.dart';

abstract class DogApi {
  Future<DogResponse> getRandomDog();
  Future<DogResponse> getDogByBreed({required String breed});
}