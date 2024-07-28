

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_network_error.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
@immutable
class CommonNetworkError extends BaseNetworkErrorModel {
  CommonNetworkError({
    super.statusCode,
    super.errorCode,
    super.errorMessage,
  }) : super(
          errorType: NetworkErrorType.Network,
        );

  factory CommonNetworkError.fromJson(Map<String, dynamic> json) {
    return CommonNetworkError(
      statusCode: json['statusCode'] as String?,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'errorCode': errorCode,
      'errorMessage': errorMessage,
      'errorType': errorType,
    };
  }

  @override
  CommonNetworkError fromJson(Map<String, dynamic> json) {
    return CommonNetworkError(
      statusCode: json['statusCode'] as String?,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  @override
  CommonNetworkError fromCustomJson(Map<String, dynamic> json) =>
      fromJson(json);

  @override
  String toString() {
    return 'CommonNetworkError{statusCode: $statusCode, errorCode: $errorCode, errorMessage: $errorMessage, errorType: $errorType}';
  }
}
