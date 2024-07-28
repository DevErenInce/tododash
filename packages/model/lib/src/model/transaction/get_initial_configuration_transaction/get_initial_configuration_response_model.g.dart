// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_initial_configuration_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInitialConfigurationResponseModel
    _$GetInitialConfigurationResponseModelFromJson(Map<String, dynamic> json) =>
        GetInitialConfigurationResponseModel(
          configurations: (json['documents'] as List<dynamic>?)
              ?.map(
                  (e) => ConfigurationModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          total: (json['total'] as num?)?.toInt(),
        );

Map<String, dynamic> _$GetInitialConfigurationResponseModelToJson(
    GetInitialConfigurationResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'documents', instance.configurations?.map((e) => e.toJson()).toList());
  writeNotNull('total', instance.total);
  return val;
}
