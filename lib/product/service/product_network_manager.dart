import 'package:core/core.dart';
import 'package:generation/generation.dart';

/// Product network manager
final class ProductNetworkManager {
  ProductNetworkManager.init() {
    // init network manager
    manager = NetworkManager(
      networkApiClientList: [
        AppWriteNetworkApiClient(
          isDefault: true,
          option: NetworkOptionModel(
            baseEndPoint: AppEnvironment.env.appWriteBaseEndPoint,
            projectId: AppEnvironment.env.appWriteProjectId,
          ),
        ),
      ],
    );
  }

  late final NetworkManager manager;
}
