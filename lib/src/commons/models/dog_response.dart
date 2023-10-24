import 'package:json_annotation/json_annotation.dart';

part 'dog_response.g.dart';

enum StatusResponse { success, error }

sealed class DogResponse {
  @JsonKey(disallowNullValue: true, unknownEnumValue: StatusResponse.error)
  final StatusResponse status;

  DogResponse({required this.status});
}

@JsonSerializable()
class DogResponseError extends DogResponse {
  final String message;
  final int code;

  DogResponseError({required this.message, required this.code, required super.status});

  factory DogResponseError.fromJson(json) => _$DogResponseErrorFromJson(json);
}

@JsonSerializable()
class RandomDogResponse extends DogResponse {
  @JsonKey(name: 'message')
  final Uri dogUrl;

  RandomDogResponse({required this.dogUrl, required super.status});

  factory RandomDogResponse.fromJson(json) => _$RandomDogResponseFromJson(json);
}
