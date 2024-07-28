import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';

part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class LoginResponseModel extends BaseResponseModel {
  LoginResponseModel({
    this.session,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  final SessionModel? session;

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  LoginResponseModel fromJson(Map<String, dynamic>? json) =>
      _$LoginResponseModelFromJson(json!);

  @override
  LoginResponseModel fromCustomJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      session: SessionModel().fromCustomJson(json),
    );
  }

  @override
  String toString() {
    return 'LoginResponseModel{session:$session}';
  }
}
