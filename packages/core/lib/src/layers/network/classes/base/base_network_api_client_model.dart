import 'package:core/core.dart';
import 'package:core/src/layers/network/constant/enum/network_api_client_type.dart';

abstract class BaseNetworkApiClientModel {
  BaseNetworkApiClientModel({
    required this.option,
    required this.type,
    this.isDefault = false,
  });

  NetworkApiClientType type;
  NetworkOptionModel option;
  bool isDefault;

  Future<void> init();

  Future<void> dispose();

  Future<T> create<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> read<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> update<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> delete<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> stream<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> register<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> registerWithGoogle<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> login<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> loginWithGoogle<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

  Future<T> logout<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  );

}
