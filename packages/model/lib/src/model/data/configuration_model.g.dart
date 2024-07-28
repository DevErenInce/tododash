// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurationModel _$ConfigurationModelFromJson(Map<String, dynamic> json) =>
    ConfigurationModel(
      keyword: json['Keyword'] as String?,
      value: json['Value'] as String?,
      description: json['Description'] as String?,
      valueType: json['ValueType'] as String?,
      configurationType: json['ConfigurationType'] as String?,
      isClientCache: json['IsClientCache'] as bool?,
      createdAt: json['CreatedAt'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
    );

Map<String, dynamic> _$ConfigurationModelToJson(ConfigurationModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Keyword', instance.keyword);
  writeNotNull('Value', instance.value);
  writeNotNull('Description', instance.description);
  writeNotNull('ValueType', instance.valueType);
  writeNotNull('ConfigurationType', instance.configurationType);
  writeNotNull('IsClientCache', instance.isClientCache);
  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('UpdatedAt', instance.updatedAt);
  return val;
}
