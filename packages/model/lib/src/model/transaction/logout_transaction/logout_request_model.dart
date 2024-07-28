

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_request_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
@immutable
class LogoutRequestModel extends BaseRequestModel {
  const LogoutRequestModel({
    this.sessionId,
  });

  factory LogoutRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestModelFromJson(json);

  final String? sessionId;

  @override
  Map<String, dynamic> toJson() => _$LogoutRequestModelToJson(this);

  @override
  LogoutRequestModel fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestModelFromJson(json);

  @override
  String toString() {
    return 'LogoutRequestModel{sessionId: $sessionId}';
  }
}
