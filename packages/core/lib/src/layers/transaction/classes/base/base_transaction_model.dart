import 'package:core/src/common/errors/request_validation_error.dart';
import 'package:core/src/layers/transaction/classes/base/base_network_error_model.dart';
import 'package:core/src/layers/transaction/classes/base/base_request_model.dart';
import 'package:core/src/layers/transaction/classes/base/base_response_model.dart';
import 'package:core/src/layers/transaction/classes/transaction_configuration.dart';

abstract class BaseTransactionModel<TRequest extends BaseRequestModel,
    TResponse extends BaseResponseModel, TError extends BaseNetworkErrorModel> {
  BaseTransactionModel({
    required this.request,
    required this.response,
    required this.error,
    required this.configuration,
    this.isSuccess,
  });

  TRequest request;
  TResponse response;
  TError error;
  TransactionConfiguration configuration;
  bool? isSuccess;

  void checkTransactionValid() {
    if (configuration.requiredFields != null &&
        configuration.requiredFields!.isNotEmpty) {
      for (final field in configuration.requiredFields!) {
        if (request.toJson().containsKey(field)) {
          final value = request.toJson()[field];
          if (value == null || value == '' || value == 'null') {
            throw RequestValidationError(
              'Field $field is required and cannot be null',
            );
          }
        } else {
          throw RequestValidationError(
            'Field $field is required',
          );
        }
      }
    }
  }

  void setResponseFromJson(Map<String, dynamic> data) {
    response = response.fromJson(data) as TResponse;
    isSuccess = true;
  }

  void setResponseFromCustomJson(Map<String, dynamic> data) {
    response = response.fromCustomJson(data) as TResponse;
    isSuccess = true;
  }

  void setErrorFromJson(
    Map<String, dynamic> data,
  ) {
    error = error.fromJson(data) as TError;
    isSuccess = false;
  }

  void setErrorFromCustomJson(
    Map<String, dynamic> data,
  ) {
    error = error.fromCustomJson(data) as TError;
    isSuccess = false;
  }
}
