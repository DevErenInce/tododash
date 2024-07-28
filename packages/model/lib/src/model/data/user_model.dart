import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UserModel extends BaseResponseModel {
  UserModel({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final String? id;
  final String? name;
  final String? surname;
  final String? email;
  final String? createdAt;
  final String? updatedAt;

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  UserModel fromJson(Map<String, dynamic>? json) =>
      _$UserModelFromJson(json!);

  @override
  UserModel fromCustomJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[r'$id'] as String?,
      name: json['name'] as String?,
      surname: json['name'] as String?,
      email: json['email'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
    );
  }

  @override
  String toString() {
    return 'UserModel{id:$id, name: $name, surname: $surname, email: $email}';
  }
}
