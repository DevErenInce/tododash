// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutRequestModel _$LogoutRequestModelFromJson(Map<String, dynamic> json) =>
    LogoutRequestModel(
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$LogoutRequestModelToJson(LogoutRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sessionId', instance.sessionId);
  return val;
}
