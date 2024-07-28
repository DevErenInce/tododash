import 'package:core/core.dart';
import 'package:tododash/product/cache/product_cache_manager.dart';
import 'package:tododash/product/service/product_network_manager.dart';
import 'package:tododash/product/state/container/product_state_container.dart';

final class ProductStateItems {
  const ProductStateItems._();
  static NetworkManager get networkManager =>
      ProductContainer.read<ProductNetworkManager>().manager;
  static CacheManager get cacheManager =>
      ProductContainer.read<ProductCacheManager>().manager;
}
