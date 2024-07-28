import 'package:core/core.dart';
import 'package:generation/generation.dart';

enum NetworkPathKeys {
  configuration,
  testCollection,
}

class NetworkPathManager {
  NetworkPathManager._init();
  static NetworkPathManager? _instance;
  static final NetworkPathManager instance =
      _instance ??= NetworkPathManager._init();

  NetworkPathModel configurationPath = NetworkPathModel(
    key: NetworkPathKeys.configuration.name,
    database: NetworkPathItemModel(
      id: AppEnvironment.env.appWriteMainDatabaseId,
    ),
    collection: NetworkPathItemModel(
      id: AppEnvironment.env.appWriteConfigurationCollectionId,
    ),
  );

  NetworkPathModel testCollectionPath = NetworkPathModel(
    key: NetworkPathKeys.testCollection.name,
    database: NetworkPathItemModel(
      id: AppEnvironment.env.appWriteMainDatabaseId,
    ),
    collection: NetworkPathItemModel(
      id: AppEnvironment.env.appWriteTestCollectionId,
    ),
  );
}
