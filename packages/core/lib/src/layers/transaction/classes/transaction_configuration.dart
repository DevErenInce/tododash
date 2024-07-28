import 'package:core/core.dart';

class TransactionConfiguration {
  TransactionConfiguration({
    required this.operationType,
    required this.path,
    this.header,
    this.query,
    this.useResponseFromCustomJson = false,
    this.useErrorFromCustomJson = false,
    this.requiredFields = const [],
  });

  final TransactionOperationType operationType;
  final NetworkPathModel path;
  final Map<String, dynamic>? header;
  final List<NetworkQueryModel<dynamic>>? query;
  final bool useResponseFromCustomJson;
  final bool useErrorFromCustomJson;
  final List<String>? requiredFields;
}
