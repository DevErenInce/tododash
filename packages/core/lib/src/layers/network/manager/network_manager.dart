import 'package:core/core.dart';
import 'package:core/src/layers/network/constant/enum/network_api_client_type.dart';

class NetworkManager {
  NetworkManager({
    required this.networkApiClientList,
  }) {
    for (final networkApiManager in networkApiClientList) {
      if (networkApiManager.isDefault) {
        _defaultNetworkApiClient = networkApiManager;
      }
    }
  }

  final List<BaseNetworkApiClientModel> networkApiClientList;
  BaseNetworkApiClientModel? _defaultNetworkApiClient;

  Future<T> execute<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction, {
    NetworkApiClientType? useCustomApiManager,
  }) async {
    if (useCustomApiManager != null) {
      final networkApiManager = networkApiClientList.firstWhere(
        (element) => element.type == useCustomApiManager,
        orElse: () => throw Exception('API Manager not found'),
      );

      return _handleApiClient<T>(transaction, networkApiManager);
    }
    if (_defaultNetworkApiClient == null) {
      throw Exception('Default API Manager not found');
    }

    return _handleApiClient<T>(transaction, _defaultNetworkApiClient!);
  }

  Future<T> _handleApiClient<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
    BaseNetworkApiClientModel networkApiManager,
  ) async {
    switch (transaction.configuration.operationType) {
      //Network Operations
      case TransactionOperationType.Create:
        return networkApiManager.create<T>(transaction);
      case TransactionOperationType.Read:
        return networkApiManager.read<T>(transaction);
      case TransactionOperationType.Update:
        return networkApiManager.update<T>(transaction);
      case TransactionOperationType.Delete:
        return networkApiManager.delete<T>(transaction);
      case TransactionOperationType.Stream:
        return networkApiManager.stream<T>(transaction);
      //Authentication Operations
      case TransactionOperationType.Register:
        return networkApiManager.register<T>(transaction);
      case TransactionOperationType.RegisterWithGoogle:
        return networkApiManager.registerWithGoogle<T>(transaction);
      case TransactionOperationType.Login:
        return networkApiManager.login<T>(transaction);
      case TransactionOperationType.LoginWithGoogle:
        return networkApiManager.loginWithGoogle<T>(transaction);
      case TransactionOperationType.Logout:
        return networkApiManager.logout<T>(transaction);
    }
  }
}
