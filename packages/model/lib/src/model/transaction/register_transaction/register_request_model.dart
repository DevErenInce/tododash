import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
@immutable
class RegisterRequestModel extends BaseRequestModel {
  const RegisterRequestModel({
    this.name,
    this.surname,
    this.email,
    this.password,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  final String? name;
  final String? surname;
  final String? email;
  final String? password;

  @override
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);

  @override
  RegisterRequestModel fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  @override
  String toString() {
    return 'RegisterRequestModel{name: $name, surname: $surname, email: $email, password: $password}';
  }
}
