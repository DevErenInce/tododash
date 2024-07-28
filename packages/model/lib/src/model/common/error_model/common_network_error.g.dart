// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_network_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonNetworkError _$CommonNetworkErrorFromJson(Map<String, dynamic> json) =>
    CommonNetworkError(
      statusCode: json['statusCode'] as String?,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$CommonNetworkErrorToJson(CommonNetworkError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('statusCode', instance.statusCode);
  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  return val;
}
