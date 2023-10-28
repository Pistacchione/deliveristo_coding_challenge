import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../models/breed.dart';
import '../models/dog_response.dart';
import 'dog_api.dart';

class DogApiImpl implements DogApi {
  final Dio _dio;

  DogApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<RandomDogResponse> getRandomDog() async {
    final response = await _dio.get('/api/breeds/image/random');

    return RandomDogResponse.fromJson(response.data);
  }

  @override
  Future<RandomDogResponse> getDogByBreed({required String breed}) async {
    final response = await _dio.get('/api/breed/$breed/images/random');

    return RandomDogResponse.fromJson(response.data);
  }

  @override
  Future<List<Breed>> getBreeds() async {
    final response = await _dio.get('/api/breeds/list/all');
    final message = response.data['message'] as Map<String, dynamic>;
    final listOfBreed = message.keys.map((breed) {
      final subBreed = message[breed];
      if (subBreed is List && subBreed.all((t) => t is String)) {
        return Breed(name: breed, subBreeds: List<String>.from(subBreed));
      }

      return Breed(name: breed);
    }).toList();

    return listOfBreed;
  }

  @override
  Future<List<RandomDogResponse>> getDogsByBreed({required String breed}) async {
    final response = await _dio.get('/api/breed/$breed/images');

    return RandomDogResponse.allDog(response.data);
  }

  @override
  Future<RandomDogResponse> getDogByBreedSubBreed({
    required String breed,
    required String subBreed,
  }) async {
    final response = await _dio.get('/api/breed/$breed/$subBreed/images/random');

    return RandomDogResponse.fromJson(response.data);
  }

  @override
  Future<List<RandomDogResponse>> getDogsByBreedSubBreed({
    required String breed,
    required String subBreed,
  }) async {
    final response = await _dio.get('/api/breed/$breed/$subBreed/images');

    return RandomDogResponse.allDog(response.data);
  }
}
