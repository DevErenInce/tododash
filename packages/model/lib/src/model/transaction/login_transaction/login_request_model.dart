

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
@immutable
class LoginRequestModel extends BaseRequestModel {
  const LoginRequestModel({
    this.email,
    this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  final String? email;
  final String? password;

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @override
  String toString() {
    return 'LoginRequestModel{email: $email, password: $password}';
  }
}
