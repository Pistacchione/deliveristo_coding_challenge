import 'package:fpdart/fpdart.dart';

import '../../application/errors/errors.dart';
import '../models/dog_response.dart';

abstract class DogRepository {
  TaskEither<Failure, RandomDogResponse> getRandomDog();
}