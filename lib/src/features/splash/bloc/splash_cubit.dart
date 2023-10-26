import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/usecases/usecase_params.dart';
import '../../../commons/models/dog_response.dart';
import '../../../commons/usecases/get_random_dog_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetRandomDogUseCase _getRandomDogUseCase;

  SplashCubit({required GetRandomDogUseCase getRandomDogUseCase})
      : _getRandomDogUseCase = getRandomDogUseCase,
        super(SplashStateInitial());

  void getRandomDog() async {
    emit(SplashStateLoading());
    final randomDog = await _getRandomDogUseCase(NoParams()).run();
    randomDog.match(
      (failure) => emit(SplashStateError(message: failure.message)),
      (dog) => emit(SplashStateDog(dog: dog)),
    );
  }
}
