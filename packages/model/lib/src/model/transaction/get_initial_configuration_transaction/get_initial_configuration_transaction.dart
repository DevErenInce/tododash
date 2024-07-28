import 'package:core/core.dart';
import 'package:model/src/model/common/error_model/common_network_error.dart';
import 'package:model/src/model/common/request_model/empty_request_model.dart';
import 'package:model/src/model/transaction/get_initial_configuration_transaction/get_initial_configuration_response_model.dart';
import 'package:model/src/network_path/network_path_manager.dart';

class GetInitialConfigurationTransaction extends BaseTransactionModel<
    EmptyRequestModel,
    GetInitialConfigurationResponseModel,
    CommonNetworkError> {
  GetInitialConfigurationTransaction()
      : super(
          request: const EmptyRequestModel(),
          error: CommonNetworkError(),
          response: GetInitialConfigurationResponseModel(),
          configuration: TransactionConfiguration(
            operationType: TransactionOperationType.Read,
            path: NetworkPathManager.instance.configurationPath,
          ),
        );
}
