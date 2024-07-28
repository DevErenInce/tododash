import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

@immutable
abstract class ICacheModel<T> extends BaseModel<T> {
  const ICacheModel({
    this.id,
    this.key,
  });

  final Id? id;
  final String? key;

  T copyWith({
    Id? id,
    String? key,
  });
}
