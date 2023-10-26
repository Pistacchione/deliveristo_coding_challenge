sealed class Failure {
  final String message;

  Failure({required this.message});
}

class DataFailure extends Failure {
  DataFailure({required super.message});
}