import 'package:get_it/get_it.dart';
import 'package:tododash/product/cache/product_cache_manager.dart';
import 'package:tododash/product/service/product_network_manager.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton(
        ProductNetworkManager.init(),
      )
      ..registerSingleton(
        ProductCacheManager.init(),
      );
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
