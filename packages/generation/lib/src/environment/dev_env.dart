import 'package:envied/envied.dart';
import 'package:generation/src/environment/app_configuration.dart';

part 'dev_env.g.dart';

@Envied(path: 'assets/env/.dev.env', obfuscate: true)
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'ENVIRONMENT')
  static final String _environment = _DevEnv._environment;

  @EnviedField(varName: 'APP_WRITE_BASE_END_POINT')
  static final String _appWriteBaseEndPoint = _DevEnv._appWriteBaseEndPoint;

  @EnviedField(varName: 'APP_WRITE_PROJECT_ID')
  static final String _appWriteProjectId = _DevEnv._appWriteProjectId;

  @EnviedField(varName: 'APP_WRITE_MAIN_DATABASE_ID')
  static final String _appWriteMainDatabaseId = _DevEnv._appWriteMainDatabaseId;

  @EnviedField(varName: 'APP_WRITE_CONFIGURATION_COLLECTION_ID')
  static final String _appWriteConfigurationCollectionId = _DevEnv._appWriteConfigurationCollectionId;

  @EnviedField(varName: 'APP_WRITE_TEST_COLLECTION_ID')
  static final String _appWriteTestCollectionId = _DevEnv._appWriteTestCollectionId;

  @override
  String get environment => _environment;

  @override
  String get appWriteBaseEndPoint => _appWriteBaseEndPoint;

  @override
  String get appWriteProjectId => _appWriteProjectId;

  @override
  String get appWriteMainDatabaseId => _appWriteMainDatabaseId;

  @override
  String get appWriteConfigurationCollectionId => _appWriteConfigurationCollectionId;

  @override
  String get appWriteTestCollectionId => _appWriteTestCollectionId;
}
