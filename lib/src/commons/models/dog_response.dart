import 'package:json_annotation/json_annotation.dart';

part 'dog_response.g.dart';

enum StatusResponse { success, error }

@JsonSerializable()
class RandomDogResponse {
  @JsonKey(disallowNullValue: true, unknownEnumValue: StatusResponse.error)
  final StatusResponse status;

  @JsonKey(name: 'message')
  final String url;

  RandomDogResponse({required this.status, required this.url});

  factory RandomDogResponse.fromJson(json) => _$RandomDogResponseFromJson(json);
}
