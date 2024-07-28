import 'package:core/core.dart';
import 'package:model/model.dart';

class LoginTransaction extends BaseTransactionModel<LoginRequestModel,
    LoginResponseModel, CommonNetworkError> {
  LoginTransaction({
    required super.request,
  }) : super(
          response: LoginResponseModel(),
          error: CommonNetworkError(),
          configuration: TransactionConfiguration(
            useResponseFromCustomJson: true,
            operationType: TransactionOperationType.Login,
            path: NetworkPathModel.empty(),
            requiredFields: [
              AuthenticationKeys.Email,
              AuthenticationKeys.Password,
            ],
          ),
        );
}
