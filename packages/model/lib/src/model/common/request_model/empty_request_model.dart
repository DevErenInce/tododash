import 'package:core/core.dart';
import 'package:flutter/material.dart';

@immutable
class EmptyRequestModel extends BaseRequestModel {
  const EmptyRequestModel();

  factory EmptyRequestModel.fromJson() {
    return const EmptyRequestModel();
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  EmptyRequestModel fromJson(Map<String, dynamic> json) {
    return const EmptyRequestModel();
  }

  @override
  String toString() {
    return 'EmptyRequestModel()';
  }
}
