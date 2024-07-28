import 'package:core/core.dart';
import 'package:model/model.dart';

class RegisterTransaction extends BaseTransactionModel<RegisterRequestModel,
    RegisterResponseModel, CommonNetworkError> {
  RegisterTransaction({
    required super.request,
  }) : super(
          response: RegisterResponseModel(),
          error: CommonNetworkError(),
          configuration: TransactionConfiguration(
            useResponseFromCustomJson: true,
            operationType: TransactionOperationType.Register,
            path: NetworkPathModel.empty(),
            requiredFields: [AuthenticationKeys.Password],
          ),
        );
}
