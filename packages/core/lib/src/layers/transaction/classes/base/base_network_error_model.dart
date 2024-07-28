import 'package:core/core.dart';

abstract class BaseNetworkErrorModel extends BaseModel<BaseNetworkErrorModel> {
  BaseNetworkErrorModel({
    this.statusCode,
    this.errorCode,
    this.errorMessage,
    this.errorType,
  });

  final String? statusCode;
  final String? errorCode;
  final String? errorMessage;
  final NetworkErrorType? errorType;

  @override
  BaseNetworkErrorModel fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson();
  BaseNetworkErrorModel fromCustomJson(Map<String, dynamic> json);
}
