import 'package:core/core.dart';

abstract class ICacheApiManager {
  ICacheApiManager({
    required this.type,
    this.isDefault = false,
  });

  CacheApiManagerType type;

  bool isDefault;

  Future<void> init();

  Future<T> create<T extends ICacheModel<T>>(T model);

  Future<T?> get<T extends ICacheModel<T>>({
    int? id,
    String? key,
    T? parseModel,
  });

  Future<List<T>> getAll<T extends ICacheModel<T>>({
    T? parseModel,
  });

  Future<T> update<T extends ICacheModel<T>>(T model);

  Future<bool> delete<T extends ICacheModel<T>>({
    int? id,
    String? key,
  });
}
