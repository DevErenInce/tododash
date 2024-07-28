import 'package:core/core.dart';
import 'package:core/src/layers/network/classes/base/base_network_query_model.dart';

class NetworkQueryManager<T> {
  NetworkQueryManager({
    required BaseNetworkQueryModel<T> manager,
  }) : _manager = manager;

  final BaseNetworkQueryModel<T> _manager;

  List<T> getQueryList(List<NetworkQueryModel<dynamic>>? queries) {
    if (queries == null) {
      return <T>[];
    }

    final list = <T>[];

    for (final query in queries) {
      list.add(_manager.getQuery(query));
    }

    return list;
  }

  T getQuery(NetworkQueryModel<dynamic> query) {
    return _manager.getQuery(query);
  }
}
