import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_response_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class LogoutResponseModel extends BaseResponseModel {
  LogoutResponseModel({
    this.success,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);

  final bool? success;

  @override
  Map<String, dynamic> toJson() => _$LogoutResponseModelToJson(this);

  @override
  LogoutResponseModel fromJson(Map<String, dynamic>? json) =>
      _$LogoutResponseModelFromJson(json!);

  @override
  LogoutResponseModel fromCustomJson(Map<String, dynamic> json) {
    return LogoutResponseModel(
      success: json['success'] as bool?,
    );
  }

  @override
  String toString() {
    return 'LogoutResponseModel{success: $success}';
  }
}
