import 'package:core/src/common/classes/base_model.dart';

abstract class BaseRequestModel extends BaseModel<BaseRequestModel> {
  const BaseRequestModel();

  @override
  BaseRequestModel fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson();

  dynamic getFieldValue(String key) {
    final jsonValue = toJson();
    return jsonValue[key];
  }
}
