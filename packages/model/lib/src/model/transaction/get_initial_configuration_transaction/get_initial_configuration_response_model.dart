import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/src/model/data/configuration_model.dart';

part 'get_initial_configuration_response_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GetInitialConfigurationResponseModel extends BaseResponseModel {
  GetInitialConfigurationResponseModel({
    this.configurations,
    this.total,
  });

  factory GetInitialConfigurationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GetInitialConfigurationResponseModelFromJson(json);

  @JsonKey(name: 'documents')
  final List<ConfigurationModel>? configurations;
  final int? total;

  @override
  Map<String, dynamic> toJson() =>
      _$GetInitialConfigurationResponseModelToJson(this);

  @override
  GetInitialConfigurationResponseModel fromJson(Map<String, dynamic>? json) =>
      _$GetInitialConfigurationResponseModelFromJson(json!);

  @override
  BaseResponseModel fromCustomJson(Map<String, dynamic> json) =>
      _$GetInitialConfigurationResponseModelFromJson(json);

  @override
  String toString() {
    return 'InitConfigurationResponseModel{configurations: $configurations, total: $total}';
  }
}
