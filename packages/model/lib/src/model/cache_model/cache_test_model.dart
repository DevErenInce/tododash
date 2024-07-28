
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cache_test_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
@collection
@immutable
class CacheTestModel implements ICacheModel<CacheTestModel> {
  const CacheTestModel({
    this.name,
    this.surname,
    this.age,
    this.isAdult,
    this.id,
    this.key,
  });

  factory CacheTestModel.fromJson(Map<String, dynamic> json) =>
      _$CacheTestModelFromJson(json);

  @override
  final Id? id;
  @override
  final String? key;
  final String? name;
  final String? surname;
  final int? age;
  final bool? isAdult;

  @override
  Map<String, dynamic> toJson() => _$CacheTestModelToJson(this);

  @override
  CacheTestModel fromJson(Map<String, dynamic> json) =>
      _$CacheTestModelFromJson(json);

  @override
  CacheTestModel copyWith({
    Id? id,
    String? key,
    String? name,
    String? surname,
    int? age,
    bool? isAdult,
  }) {
    return CacheTestModel(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      age: age ?? this.age,
      isAdult: isAdult ?? this.isAdult,
    );
  }

  @override
  String toString() {
    return 'CacheTestModel{name: $name, surname: $surname, age: $age, isAdult: $isAdult}';
  }
}
