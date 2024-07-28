import 'package:core/core.dart';

abstract class BaseResponseModel extends BaseModel<BaseResponseModel> {
  const BaseResponseModel();

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson();

  BaseResponseModel fromCustomJson(Map<String, dynamic> json);
}
