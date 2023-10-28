sealed class UseCaseParams {}

class NoParams extends UseCaseParams {}

class BreedParams extends UseCaseParams {
  final String breed;

  BreedParams({required this.breed});
}

class BreedSubBreedParams extends UseCaseParams {
  final String breed;
  final String subBreed;

  BreedSubBreedParams({required this.breed, required this.subBreed});
}
