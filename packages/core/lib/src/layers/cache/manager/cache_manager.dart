import 'package:core/core.dart';
import 'package:core/src/layers/cache/interface/ICacheApiManager.dart';

class CacheManager {
  CacheManager({
    required this.cacheApiManagerList,
  }) {
    for (final cacheApiManager in cacheApiManagerList) {
      if (cacheApiManager.isDefault) {
        _defaultCacheApiManager = cacheApiManager;
      }
    }
  }

  final List<ICacheApiManager> cacheApiManagerList;
  ICacheApiManager? _defaultCacheApiManager;

  ICacheApiManager _getCustomApiManager(
    CacheApiManagerType useCustomCacheApiManager,
  ) {
    final customCacheApiManager = cacheApiManagerList.firstWhere(
      (element) => element.type == useCustomCacheApiManager,
      orElse: () => throw Exception('API Manager not found'),
    );

    return customCacheApiManager;
  }

  ICacheApiManager _checkDefaultCacheApiManager() {
    if (_defaultCacheApiManager == null) {
      throw Exception('Default API Manager not found');
    }
    return _defaultCacheApiManager!;
  }

  ICacheApiManager _getCacheApiManager(
    CacheApiManagerType? useCustomCacheApiManager,
  ) {
    final manager = useCustomCacheApiManager != null
        ? _getCustomApiManager(useCustomCacheApiManager)
        : _checkDefaultCacheApiManager();

    return manager;
  }

  Future<void> init() async {
    for (final cacheApiManager in cacheApiManagerList) {
      await cacheApiManager.init();
    }
  }

  Future<T> create<T extends ICacheModel<T>>(
    T model, {
    CacheApiManagerType? useCustomCacheApiManager,
  }) async {
    final manager = _getCacheApiManager(useCustomCacheApiManager);
    return manager.create<T>(model);
  }

  Future<T?> get<T extends ICacheModel<T>>({
    int? id,
    String? key,
    T? parseModel,
    CacheApiManagerType? useCustomCacheApiManager,
  }) async {
    final manager = _getCacheApiManager(useCustomCacheApiManager);
    return manager.get<T>(id: id, key: key, parseModel: parseModel);
  }

  Future<List<T>> getAll<T extends ICacheModel<T>>({
    T? parseModel,
    CacheApiManagerType? useCustomCacheApiManager,
  }) async {
    final manager = _getCacheApiManager(useCustomCacheApiManager);
    return manager.getAll<T>(parseModel: parseModel);
  }

  Future<T> update<T extends ICacheModel<T>>(
    T model, {
    CacheApiManagerType? useCustomCacheApiManager,
  }) async {
    final manager = _getCacheApiManager(useCustomCacheApiManager);
    return manager.update<T>(model);
  }

  Future<bool> delete<T extends ICacheModel<T>>({
    int? id,
    String? key,
    CacheApiManagerType? useCustomCacheApiManager,
  }) async {
    final manager = _getCacheApiManager(useCustomCacheApiManager);
    return manager.delete<T>(id: id, key: key);
  }
}
