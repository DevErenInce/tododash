import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:core/src/common/errors/request_validation_error.dart';
import 'package:core/src/layers/network/constant/enum/network_api_client_type.dart';

class AppWriteNetworkApiClient extends BaseNetworkApiClientModel {
  AppWriteNetworkApiClient({
    required super.option,
    super.isDefault = false,
  }) : super(
          type: NetworkApiClientType.AppWrite,
        ) {
    init();
  }

  bool _initialized = false;

  late Client _client;

  late Databases _databases;
  late Account _account;

  late NetworkQueryManager<String> _queryManager;

  Future<void> _checkInitialized() async {
    if (!_initialized) {
      await init();
    }
  }

  @override
  Future<void> init() async {
    if (!_initialized) {
      _client = Client()
              .setEndpoint(option.baseEndPoint) // Your Appwrite Endpoint
              .setProject(option.projectId) // Your project ID
              .setSelfSigned() // Use only on dev mode with a self-signed SSL
          ;
      _databases = Databases(_client);
      _account = Account(_client);
      _queryManager = NetworkQueryManager<String>(
        manager: const AppWriteNetworkQueryClient(),
      );
      _initialized = true;
    }
  }

  @override
  Future<void> dispose() async {
    //Dispose operation
  }

  @override
  Future<T> create<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();

    try {
      transaction.checkTransactionValid();
      final request = transaction.request;
      final document = await _databases.createDocument(
        databaseId: transaction.configuration.path.database?.id ?? '',
        collectionId: transaction.configuration.path.collection?.id ?? '',
        documentId: ID.unique(),
        data: request.toJson(),
      );

      return _handleResponse(transaction, document.data) as T;
    } on AppwriteException catch (e) {
      return _handleError(transaction, e) as T;
    }
  }

  @override
  Future<T> read<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    try {
      transaction.checkTransactionValid();
      final response = await _databases.listDocuments(
        databaseId: transaction.configuration.path.database?.id ?? '',
        collectionId: transaction.configuration.path.collection?.id ?? '',
        queries: _queryManager.getQueryList(transaction.configuration.query),
      );

      final jsonData = {
        'documents': response.documents.map((e) => e.data).toList(),
        'total': response.total,
      };
      return _handleResponse(transaction, jsonData) as T;
    } on AppwriteException catch (e) {
      return _handleError(transaction, e) as T;
    }
  }

  @override
  Future<T> update<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    transaction.checkTransactionValid();
    return transaction as T;
  }

  @override
  Future<T> delete<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    transaction.checkTransactionValid();
    return transaction as T;
  }

  @override
  Future<T> stream<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    transaction.checkTransactionValid();
    return transaction as T;
  }

  @override
  Future<T> register<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    try {
      transaction.checkTransactionValid();
      final email =
          transaction.request.getFieldValue(AuthenticationKeys.Email) as String;
      final password = transaction.request
          .getFieldValue(AuthenticationKeys.Password) as String;

      final result = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return _handleResponse(transaction, result.toMap()) as T;
    } on AppwriteException catch (e) {
      return _handleError(transaction, e) as T;
    }
  }

  @override
  Future<T> registerWithGoogle<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    transaction.checkTransactionValid();
    return transaction as T;
  }

  @override
  Future<T> login<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    try {
      transaction.checkTransactionValid();
      final email =
          transaction.request.getFieldValue(AuthenticationKeys.Email) as String;
      final password = transaction.request
          .getFieldValue(AuthenticationKeys.Password) as String;

      final result = await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      return _handleResponse(transaction, result.toMap()) as T;
    } on AppwriteException catch (e) {
      return _handleError(transaction, e) as T;
    }
  }

  @override
  Future<T> loginWithGoogle<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    transaction.checkTransactionValid();
    return transaction as T;
  }

  @override
  Future<T> logout<
      T extends BaseTransactionModel<BaseRequestModel, BaseResponseModel,
          BaseNetworkErrorModel>>(
    BaseTransactionModel transaction,
  ) async {
    await _checkInitialized();
    try {
      transaction.checkTransactionValid();
      final sessionId = transaction.request
          .getFieldValue(AuthenticationKeys.SessionId) as String;

      final result = await _account.deleteSession(
        sessionId: sessionId,
      );
      if (result == '') {
        return _handleResponse(transaction, {'success': true}) as T;
      } else {
        return _handleResponse(transaction, {}) as T;
      }
    } on AppwriteException catch (e) {
      return _handleError(transaction, e) as T;
    }
  }

  BaseTransactionModel _handleResponse(
    BaseTransactionModel transaction,
    Map<String, dynamic> data,
  ) {
    if (transaction.configuration.useResponseFromCustomJson) {
      transaction.setResponseFromCustomJson(data);
    } else {
      transaction.setResponseFromJson(data);
    }
    return transaction;
  }

  BaseTransactionModel _handleError(
    BaseTransactionModel transaction,
    Exception e,
  ) {
    final errorData = <String, dynamic>{};

    if (e is AppwriteException) {
      errorData['errorCode'] = e.code.toString();
      errorData['errorMessage'] = e.message;
      errorData['errorType'] = e.type;
    } else if (e is RequestValidationError) {
      errorData['errorCode'] = e.code.toString();
      errorData['errorMessage'] = e.message;
      errorData['errorType'] = 'RequestValidationError';
    } else {
      errorData['errorMessage'] = e.toString();
    }

    if (transaction.configuration.useErrorFromCustomJson) {
      transaction.setErrorFromCustomJson(errorData);
    } else {
      transaction.setErrorFromJson(errorData);
    }

    return transaction;
  }
}
