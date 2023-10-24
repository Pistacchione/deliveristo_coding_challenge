import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../commons/datasources/dog_api.dart';
import '../../commons/datasources/dog_api_impl.dart';
import '../env.dart';

final injector = GetIt.instance;

void init() {
  _initDependencies();
  _initCore();
  _initApi();
  _initRepositories();
  _initUseCases();
  _initBlocs();
}

void _initDependencies() {}

void _initCore() {
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

void _initRepositories() {}

void _initUseCases() {}

void _initBlocs() {}
