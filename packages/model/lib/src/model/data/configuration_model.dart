import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'configuration_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.pascal,
  explicitToJson: true,
  includeIfNull: false,
)
@immutable
class ConfigurationModel extends BaseModel<ConfigurationModel> {
  const ConfigurationModel({
    this.keyword,
    this.value,
    this.description,
    this.valueType,
    this.configurationType,
    this.isClientCache,
    this.createdAt,
    this.updatedAt,
  });

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationModelFromJson(json);

  final String? keyword;
  final String? value;
  final String? description;
  final String? valueType;
  final String? configurationType;
  final bool? isClientCache;
  final String? createdAt;
  final String? updatedAt;

  @override
  Map<String, dynamic> toJson() => _$ConfigurationModelToJson(this);

  @override
  ConfigurationModel fromJson(Map<String, dynamic> json) =>
      _$ConfigurationModelFromJson(json);

  @override
  String toString() {
    return 'ConfigurationModel{keyword: $keyword, value: $value, description: $description, valueType: $valueType, configurationType: $configurationType, clientCache: $isClientCache, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
