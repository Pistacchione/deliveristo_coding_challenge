import 'package:dio/dio.dart';

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
    final response = await _dio.get('/api/breeds/$breed/image/random');

    return RandomDogResponse.fromJson(response.data);
  }
}
