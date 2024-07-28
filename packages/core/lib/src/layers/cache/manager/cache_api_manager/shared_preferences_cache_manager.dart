import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/src/layers/cache/interface/ICacheApiManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCacheManager extends ICacheApiManager {
  SharedPreferencesCacheManager({
    super.type = CacheApiManagerType.SharedPreference,
    super.isDefault,
  }) {
    init();
  }

  late SharedPreferences _instance;

  @override
  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  @override
  Future<T> create<T extends ICacheModel<T>>(T model) async {
    if (model.key == null) {
      throw Exception('Key is null');
    }

    final key = '${model.key!}_${T.runtimeType}';
    final result = await _instance.setString(key, jsonEncode(model.toJson()));
    if (result) {
      return model;
    } else {
      throw Exception('Error while saving data');
    }
  }

  @override
  Future<T?> get<T extends ICacheModel<T>>({
    int? id,
    String? key,
    T? parseModel,
  }) async {
    if (parseModel == null) {
      throw Exception('Parse model is null');
    }

    if (key == null) {
      throw Exception('Key is null');
    }

    final runTypeKey = '${key}_${T.runtimeType}';
    final data = _instance.getString(runTypeKey);
    if (data != null) {
      return parseModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  @override
  Future<List<T>> getAll<T extends ICacheModel<T>>({T? parseModel}) async {
    if (parseModel == null) {
      throw Exception('Parse model is null');
    }

    final itemList = <T>[];
    final keys = _instance.getKeys();
    for (final key in keys) {
      if (key.contains(T.runtimeType.toString())) {
        final data = _instance.getString(key);
        if (data != null) {
          final model =
              parseModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
          itemList.add(model);
        }
      }
    }
    return itemList;
  }

  @override
  Future<T> update<T extends ICacheModel<T>>(T model) async {
    if (model.key == null) {
      throw Exception('Key is null');
    }

    final key = '${model.key!}_${T.runtimeType}';
    final result = await _instance.setString(key, jsonEncode(model.toJson()));
    if (result) {
      return model;
    } else {
      throw Exception('Error while saving data');
    }
  }

  @override
  Future<bool> delete<T extends ICacheModel<T>>({int? id, String? key}) {
    if (key == null) {
      throw Exception('Key is null');
    }

    final runTypeKey = '${key}_${T.runtimeType}';
    return _instance.remove(runTypeKey);
  }
}
