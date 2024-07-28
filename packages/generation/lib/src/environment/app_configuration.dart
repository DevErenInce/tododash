abstract class AppConfiguration {
  String get environment;

  String get appWriteBaseEndPoint;
  String get appWriteProjectId;
  
  // Database
  String get appWriteMainDatabaseId;

  //Collections
  String get appWriteConfigurationCollectionId;
  String get appWriteTestCollectionId;
}
