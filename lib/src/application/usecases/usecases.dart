import 'package:fpdart/fpdart.dart';

import '../errors/errors.dart';
import 'usecase_params.dart';

/// `FutureUseCase<Failure, Type>` represents an asynchronous computation that
/// either yields a value of type `Type` or fails yielding an error of type `Failure`.
abstract class FutureUseCase<Type, Params extends UseCaseParams> {
  TaskEither<Failure, Type> call(Params params);
}
