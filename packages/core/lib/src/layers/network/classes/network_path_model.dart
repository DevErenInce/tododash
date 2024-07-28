import 'package:core/core.dart';
import 'package:core/src/layers/network/classes/network_path_item_model.dart';

class NetworkPathModel {
  NetworkPathModel({
    required this.key,
    this.path,
    this.database,
    this.collection,
    this.document,
  });

  factory NetworkPathModel.empty() {
    return NetworkPathModel(key: '');
  }

  final String key;
  final String? path;
  final NetworkPathItemModel? database;
  final NetworkPathItemModel? collection;
  final NetworkPathItemModel? document;
}
