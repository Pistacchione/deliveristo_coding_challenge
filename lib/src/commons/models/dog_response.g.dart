// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomDogResponse _$RandomDogResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['status'],
  );
  return RandomDogResponse(
    status: $enumDecode(_$StatusResponseEnumMap, json['status'],
        unknownValue: StatusResponse.error),
    url: json['message'] as String,
  );
}

const _$StatusResponseEnumMap = {
  StatusResponse.success: 'success',
  StatusResponse.error: 'error',
};
