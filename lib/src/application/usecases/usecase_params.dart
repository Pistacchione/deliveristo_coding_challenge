sealed class UseCaseParams {}

class NoParams extends UseCaseParams {}

class BreedParams extends UseCaseParams {
  final String breed;

  BreedParams({required this.breed});
}