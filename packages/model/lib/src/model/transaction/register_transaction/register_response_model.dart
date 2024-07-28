import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/src/model/data/user_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RegisterResponseModel extends BaseResponseModel {
  RegisterResponseModel({
    this.user,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  final UserModel? user;

  @override
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);

  @override
  RegisterResponseModel fromJson(Map<String, dynamic>? json) =>
      _$RegisterResponseModelFromJson(json!);

  @override
  RegisterResponseModel fromCustomJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      user: UserModel().fromCustomJson(json),
    );
  }

  @override
  String toString() {
    return 'RegisterResponseModel{user:$user}';
  }
}
