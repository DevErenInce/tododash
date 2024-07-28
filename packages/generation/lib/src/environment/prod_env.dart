import 'package:envied/envied.dart';
import 'package:generation/src/environment/app_configuration.dart';

part 'prod_env.g.dart';

@Envied(path: 'assets/env/.prod.env', obfuscate: true)

/// Production environment variables
final class ProdEnv implements AppConfiguration {
  @EnviedField(varName: 'ENVIRONMENT')
  static final String _environment = _ProdEnv._environment;

  @EnviedField(varName: 'APP_WRITE_BASE_END_POINT')
  static final String _appWriteBaseEndPoint = _ProdEnv._appWriteBaseEndPoint;

  @EnviedField(varName: 'APP_WRITE_PROJECT_ID')
  static final String _appWriteProjectId = _ProdEnv._appWriteProjectId;

  @EnviedField(varName: 'APP_WRITE_MAIN_DATABASE_ID')
  static final String _appWriteMainDatabaseId =
      _ProdEnv._appWriteMainDatabaseId;

  @EnviedField(varName: 'APP_WRITE_CONFIGURATION_COLLECTION_ID')
  static final String _appWriteConfigurationCollectionId =
      _ProdEnv._appWriteConfigurationCollectionId;

  @EnviedField(varName: 'APP_WRITE_TEST_COLLECTION_ID')
  static final String _appWriteTestCollectionId =
      _ProdEnv._appWriteTestCollectionId;

  @override
  String get environment => _environment;

  @override
  String get appWriteBaseEndPoint => _appWriteBaseEndPoint;

  @override
  String get appWriteProjectId => _appWriteProjectId;

  @override
  String get appWriteMainDatabaseId => _appWriteMainDatabaseId;


  @override
  String get appWriteConfigurationCollectionId =>
      _appWriteConfigurationCollectionId;

  @override
  String get appWriteTestCollectionId => _appWriteTestCollectionId;
}
