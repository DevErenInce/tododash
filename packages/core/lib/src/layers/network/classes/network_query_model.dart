import 'package:core/core.dart';

class NetworkQueryModel<T> {
  const NetworkQueryModel({
    required this.key,
    required this.type,
    required this.value,
  });

  final String key;
  final NetworkQueryType type;
  final T value;

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
