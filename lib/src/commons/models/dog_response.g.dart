// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogResponseError _$DogResponseErrorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['status'],
  );
  return DogResponseError(
    message: json['message'] as String,
    code: json['code'] as int,
    status: $enumDecode(_$StatusResponseEnumMap, json['status'],
        unknownValue: StatusResponse.error),
  );
}

const _$StatusResponseEnumMap = {
  StatusResponse.success: 'success',
  StatusResponse.error: 'error',
};

RandomDogResponse _$RandomDogResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['status'],
  );
  return RandomDogResponse(
    dogUrl: Uri.parse(json['message'] as String),
    status: $enumDecode(_$StatusResponseEnumMap, json['status'],
        unknownValue: StatusResponse.error),
  );
}
