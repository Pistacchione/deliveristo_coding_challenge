import 'package:fpdart/fpdart.dart';

import '../errors/errors.dart';
import 'usecase_params.dart';

/// A type that can contain a value of type `Type` in a [Some] or no value with [None].
///
/// Used to represent type-safe missing values. Instead of using null, you define the type to be [Option].
/// In this way, you are required by the type system to handle the case in which the value is missing.
abstract class OptionUseCase<Type, Params extends UseCaseParams> {
  Option<Type> call(Params params);
}

/// Represents a value of one of two possible types, [Type] or [Failure].
abstract class EitherUseCase<Type, Params extends UseCaseParams> {
  Either<Failure, Type> call(Params params);
}

/// `FutureUseCase<Failure, Type>` represents an asynchronous computation that
/// either yields a value of type `Type` or fails yielding an error of type `Failure`.
abstract class FutureUseCase<Type, Params extends UseCaseParams> {
  TaskEither<Failure, Type> call(Params params);
}

/// `TaskUseCase` represents an asynchronous computation that yields a value of type `Type` and **never fails**.
///
/// If you want to represent an asynchronous computation that may fail, see [FutureUseCase].
abstract class TaskUseCase<Type, Params extends UseCaseParams> {
  Task<Type> call(Params params);
}

/// `IOUseCase` represents a **non-deterministic synchronous** computation that
/// can **cause side effects**, yields a value of type `Type` and **never fails**.
abstract class IOUseCase<Type, Params extends UseCaseParams> {
  IO<Type> call(Params params);
}
