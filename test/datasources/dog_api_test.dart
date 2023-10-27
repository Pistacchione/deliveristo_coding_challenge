import 'dart:convert';
import 'dart:io';

import 'package:deliveristo_flutter_challenge/src/commons/datasources/dog_api.dart';
import 'package:deliveristo_flutter_challenge/src/commons/datasources/dog_api_impl.dart';
import 'package:deliveristo_flutter_challenge/src/commons/models/breed.dart';
import 'package:deliveristo_flutter_challenge/src/commons/models/dog_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixture_reader.dart';
import 'dog_api_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio dio;
  late DogApi dogApi;

  setUp(() {
    dio = MockDio();
    dogApi = DogApiImpl(dio: dio);
  });

  group('Dog api datasource test', () {
    const isRandomResponse = TypeMatcher<RandomDogResponse>();

    test('Should return a random dog image', () async {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: json.decode(fixture('datasources/success_response.json')),
          statusCode: HttpStatus.ok,
          requestOptions: RequestOptions(),
        ),
      );

      final res = await dogApi.getRandomDog();
      expect(res, isRandomResponse);
      expect(res.status, StatusResponse.success);

      verify(dio.get('/api/breeds/image/random'));
      verifyNoMoreInteractions(dio);
    });

    test('Should return a list of breed', () async {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: json.decode(fixture('datasources/list_of_breed.json')),
          statusCode: HttpStatus.ok,
          requestOptions: RequestOptions(),
        ),
      );

      final res = await dogApi.getBreeds();
      expect(res.firstWhere((breed) => breed.name == 'australian'), isA<Breed>());
      expect(res.firstWhere((breed) => breed.name == 'australian').subBreeds, isNotEmpty);
      expect(res.firstWhere((breed) => breed.name == 'australian').subBreeds, contains('shepherd'));

      verify(dio.get('/api/breeds/list/all'));
      verifyNoMoreInteractions(dio);
    });
  });
}
