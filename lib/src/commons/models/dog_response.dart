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

  factory RandomDogResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomDogResponseFromJson(json);

  static List<RandomDogResponse> allDog(Map<String, dynamic> json) {
    return List.from(json['message'].map(
      (url) => RandomDogResponse(url: url, status: StatusResponse.success),
    ));
  }
}
