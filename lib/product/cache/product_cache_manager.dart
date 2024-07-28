import 'package:core/core.dart';
import 'package:model/model.dart';

final class ProductCacheManager {
  ProductCacheManager.init() {
    manager = CacheManager(
      cacheApiManagerList: [
        IsarCacheManager(
          isDefault: true,
          isarSchemas: [
            CacheTestModelSchema,
          ],
        ),
        SharedPreferencesCacheManager(),
      ],
    );
  }

  late final CacheManager manager;
}
