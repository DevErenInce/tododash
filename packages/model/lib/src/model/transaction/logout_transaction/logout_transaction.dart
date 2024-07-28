import 'package:core/core.dart';
import 'package:model/model.dart';

class LogoutTransaction extends BaseTransactionModel<LogoutRequestModel,
    LogoutResponseModel, CommonNetworkError> {
  LogoutTransaction({
    required super.request,
  }) : super(
          response: LogoutResponseModel(),
          error: CommonNetworkError(),
          configuration: TransactionConfiguration(
            operationType: TransactionOperationType.Logout,
            path: NetworkPathModel.empty(),
            requiredFields: [AuthenticationKeys.SessionId],
          ),
        );
}
