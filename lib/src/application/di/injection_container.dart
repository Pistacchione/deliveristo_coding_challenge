import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../commons/datasources/dog_api.dart';
import '../../commons/datasources/dog_api_impl.dart';
import '../../commons/repositories/dog_repository.dart';
import '../../commons/repositories/dog_repository_impl.dart';
import '../../commons/usecases/get_breeds_usecase.dart';
import '../../features/all_dogs_by_breed/bloc/all_dogs_by_breed_cubit.dart';
import '../../features/all_dogs_by_breed/domain/usecases/get_all_dogs_by_breed.dart';
import '../../features/all_dogs_by_breed_subbreed/bloc/all_dogs_by_breed_subbreed_cubit.dart';
import '../../features/all_dogs_by_breed_subbreed/domain/usecases/get_all_dogs_by_breed_subbreed_usecase.dart';
import '../../features/dog_by_breed/bloc/dog_by_breed_cubit.dart';
import '../../features/dog_by_breed/domain/usecases/get_random_dog_by_breed_usecase.dart';
import '../../features/dog_by_breed_subbreed/bloc/dog_by_breed_subbreed_cubit.dart';
import '../../features/dog_by_breed_subbreed/domain/usecases/get_random_dog_by_breed_subbreed_usecase.dart';
import '../../features/splash/bloc/splash_cubit.dart';
import '../../features/splash/domain/usecases/get_random_dog_usecase.dart';
import '../env.dart';
import '../routes/app_router.dart';

final injector = GetIt.instance;

void init() {
  _initCore();
  _initApi();
  _initRepositories();
  _initUseCases();
  _initBlocs();
}

void _initCore() {
  injector.registerLazySingleton<AppRouter>(() => AppRouter());
  injector.registerFactory<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: Env.http.baseUrl,
        connectTimeout: Env.http.connectTimeout,
        receiveTimeout: Env.http.receiveTimeout,
        sendTimeout: Env.http.sendTimeout,
      ),
    );
  });
}

void _initApi() {
  injector.registerFactory<DogApi>(() => DogApiImpl(dio: injector()));
}

void _initRepositories() {
  injector.registerFactory<DogRepository>(() => DogRepositoryImpl(api: injector()));
}

void _initUseCases() {
  injector.registerFactory<GetRandomDogUseCase>(() => GetRandomDogUseCase(repository: injector()));
  injector.registerFactory<GetRandomDogByBreedUseCase>(
    () => GetRandomDogByBreedUseCase(repository: injector()),
  );
  injector.registerFactory<GetBreedsUseCase>(() => GetBreedsUseCase(repository: injector()));
  injector.registerFactory<GetAllDogsByBreedUseCase>(
    () => GetAllDogsByBreedUseCase(repository: injector()),
  );
  injector.registerFactory<GetRandomDogByBreedSubBreedUseCase>(
    () => GetRandomDogByBreedSubBreedUseCase(repository: injector()),
  );
  injector.registerFactory<GetAllDogsByBreedSubBreedUseCase>(
    () => GetAllDogsByBreedSubBreedUseCase(repository: injector()),
  );
}

void _initBlocs() {
  injector.registerFactory<SplashCubit>(() => SplashCubit(getRandomDogUseCase: injector()));
  injector.registerFactory<DobByBreedCubit>(
    () => DobByBreedCubit(getBreedsUseCase: injector(), getRandomDogByBreedUseCase: injector()),
  );
  injector.registerFactory<AllDogsByBreedCubit>(
    () => AllDogsByBreedCubit(getBreedsUseCase: injector(), getAllDogsByBreedUseCase: injector()),
  );
  injector.registerFactory<DogByBreedSubBreedCubit>(
    () => DogByBreedSubBreedCubit(
        getBreedsUseCase: injector(), getRandomDogByBreedSubBreedUseCase: injector()),
  );
  injector.registerFactory<AllDogsByBreedSubBreedCubit>(
    () => AllDogsByBreedSubBreedCubit(
        getBreedsUseCase: injector(), getAllDogsByBreedSubBreedUseCase: injector()),
  );
}
