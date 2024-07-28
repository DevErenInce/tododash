// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      userId: json['userId'] as String?,
      expire: json['expire'] as String?,
      provider: json['provider'] as String?,
      providerUid: json['providerUid'] as String?,
      providerAccessToken: json['providerAccessToken'] as String?,
      providerAccessTokenExpiry: json['providerAccessTokenExpiry'] as String?,
      providerRefreshToken: json['providerRefreshToken'] as String?,
      ip: json['ip'] as String?,
      osCode: json['osCode'] as String?,
      osName: json['osName'] as String?,
      osVersion: json['osVersion'] as String?,
      clientType: json['clientType'] as String?,
      clientCode: json['clientCode'] as String?,
      clientName: json['clientName'] as String?,
      clientVersion: json['clientVersion'] as String?,
      clientEngine: json['clientEngine'] as String?,
      clientEngineVersion: json['clientEngineVersion'] as String?,
      deviceName: json['deviceName'] as String?,
      deviceBrand: json['deviceBrand'] as String?,
      deviceModel: json['deviceModel'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      current: json['current'] as bool?,
      factors: json['factors'] as List<dynamic>?,
      secret: json['secret'] as String?,
      mfaUpdatedAt: json['mfaUpdatedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('userId', instance.userId);
  writeNotNull('expire', instance.expire);
  writeNotNull('provider', instance.provider);
  writeNotNull('providerUid', instance.providerUid);
  writeNotNull('providerAccessToken', instance.providerAccessToken);
  writeNotNull('providerAccessTokenExpiry', instance.providerAccessTokenExpiry);
  writeNotNull('providerRefreshToken', instance.providerRefreshToken);
  writeNotNull('ip', instance.ip);
  writeNotNull('osCode', instance.osCode);
  writeNotNull('osName', instance.osName);
  writeNotNull('osVersion', instance.osVersion);
  writeNotNull('clientType', instance.clientType);
  writeNotNull('clientCode', instance.clientCode);
  writeNotNull('clientName', instance.clientName);
  writeNotNull('clientVersion', instance.clientVersion);
  writeNotNull('clientEngine', instance.clientEngine);
  writeNotNull('clientEngineVersion', instance.clientEngineVersion);
  writeNotNull('deviceName', instance.deviceName);
  writeNotNull('deviceBrand', instance.deviceBrand);
  writeNotNull('deviceModel', instance.deviceModel);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('countryName', instance.countryName);
  writeNotNull('current', instance.current);
  writeNotNull('factors', instance.factors);
  writeNotNull('secret', instance.secret);
  writeNotNull('mfaUpdatedAt', instance.mfaUpdatedAt);
  return val;
}
