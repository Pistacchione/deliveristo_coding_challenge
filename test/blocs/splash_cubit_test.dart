import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:deliveristo_flutter_challenge/src/application/errors/errors.dart';
import 'package:deliveristo_flutter_challenge/src/commons/models/dog_response.dart';
import 'package:deliveristo_flutter_challenge/src/commons/repositories/dog_repository.dart';
import 'package:deliveristo_flutter_challenge/src/commons/usecases/get_random_dog_usecase.dart';
import 'package:deliveristo_flutter_challenge/src/features/splash/bloc/splash_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixture_reader.dart';
import 'splash_cubit_test.mocks.dart';

@GenerateMocks([DogRepository])
void main() {
  late MockDogRepository dogRepository;
  late GetRandomDogUseCase getRandomDogUseCase;
  final successResponse = RandomDogResponse.fromJson(
    json.decode(fixture('datasources/success_response.json')),
  );
  SplashCubit splashCubit() => SplashCubit(getRandomDogUseCase: getRandomDogUseCase);

  setUp(() {
    provideDummy<TaskEither<Failure, RandomDogResponse>>(TaskEither.of(successResponse));

    dogRepository = MockDogRepository();
    getRandomDogUseCase = GetRandomDogUseCase(repository: dogRepository);
  });

  group('Splash cubit tests', () {
    blocTest<SplashCubit, SplashState>(
      'emits [SplashStateLoading, SplashStateDog] when getRandomDog is added.',
      setUp: () {
        when(dogRepository.getRandomDog()).thenReturn(TaskEither.of(successResponse));
      },
      build: splashCubit,
      act: (bloc) => bloc.getRandomDog(),
      expect: () => <SplashState>[
        SplashStateLoading(),
        SplashStateDog(dog: successResponse),
      ],
      verify: (bloc) {
        expect(bloc.state, isA<SplashStateDog>());
        expect(
          (bloc.state as SplashStateDog).dog.url,
          'https://images.dog.ceo/breeds/terrier-american/n02093428_995.jpg',
        );
      },
    );
  });
}
