import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SessionModel extends BaseResponseModel {
  SessionModel({
    this.id,
    this.createdAt,
    this.userId,
    this.expire,
    this.provider,
    this.providerUid,
    this.providerAccessToken,
    this.providerAccessTokenExpiry,
    this.providerRefreshToken,
    this.ip,
    this.osCode,
    this.osName,
    this.osVersion,
    this.clientType,
    this.clientCode,
    this.clientName,
    this.clientVersion,
    this.clientEngine,
    this.clientEngineVersion,
    this.deviceName,
    this.deviceBrand,
    this.deviceModel,
    this.countryCode,
    this.countryName,
    this.current,
    this.factors,
    this.secret,
    this.mfaUpdatedAt,
    this.updatedAt,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? userId;
  final String? expire;
  final String? provider;
  final String? providerUid;
  final String? providerAccessToken;
  final String? providerAccessTokenExpiry;
  final String? providerRefreshToken;
  final String? ip;
  final String? osCode;
  final String? osName;
  final String? osVersion;
  final String? clientType;
  final String? clientCode;
  final String? clientName;
  final String? clientVersion;
  final String? clientEngine;
  final String? clientEngineVersion;
  final String? deviceName;
  final String? deviceBrand;
  final String? deviceModel;
  final String? countryCode;
  final String? countryName;
  final bool? current;
  final List<dynamic>? factors;
  final String? secret;
  final String? mfaUpdatedAt;

  @override
  Map<String, dynamic> toJson() => _$SessionModelToJson(this);

  @override
  SessionModel fromJson(Map<String, dynamic>? json) =>
      _$SessionModelFromJson(json!);

  @override
  SessionModel fromCustomJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json[r'$id'] as String,
      createdAt: json[r'$createdAt'] as String,
      updatedAt: json[r'$updatedAt'] as String,
      userId: json['userId'] as String,
      expire: json['expire'] as String,
      provider: json['provider'] as String,
      providerUid: json['providerUid'] as String,
      providerAccessToken: json['providerAccessToken'] as String,
      providerAccessTokenExpiry: json['providerAccessTokenExpiry'] as String,
      providerRefreshToken: json['providerRefreshToken'] as String,
      ip: json['ip'] as String,
      osCode: json['osCode'] as String,
      osName: json['osName'] as String,
      osVersion: json['osVersion'] as String,
      clientType: json['clientType'] as String,
      clientCode: json['clientCode'] as String,
      clientName: json['clientName'] as String,
      clientVersion: json['clientVersion'] as String,
      clientEngine: json['clientEngine'] as String,
      clientEngineVersion: json['clientEngineVersion'] as String,
      deviceName: json['deviceName'] as String,
      deviceBrand: json['deviceBrand'] as String,
      deviceModel: json['deviceModel'] as String,
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String,
      current: json['current'] as bool,
      factors: json['factors'] as List<dynamic>,
      secret: json['secret'] as String,
      mfaUpdatedAt: json['mfaUpdatedAt'] as String,
    );
  }

  @override
  String toString() {
    return 'SessionModel{id:$id, createdAt: $createdAt, userId: $userId, expire: $expire, provider: $provider, providerUid: $providerUid, providerAccessToken: $providerAccessToken, providerAccessTokenExpiry: $providerAccessTokenExpiry, providerRefreshToken: $providerRefreshToken, ip: $ip, osCode: $osCode, osName: $osName, osVersion: $osVersion, clientType: $clientType, clientCode: $clientCode, clientName: $clientName, clientVersion: $clientVersion, clientEngine: $clientEngine, clientEngineVersion: $clientEngineVersion, deviceName: $deviceName, deviceBrand: $deviceBrand, deviceModel: $deviceModel, countryCode: $countryCode, countryName: $countryName, current: $current, factors: $factors, secret: $secret, mfaUpdatedAt: $mfaUpdatedAt}';
  }
}
