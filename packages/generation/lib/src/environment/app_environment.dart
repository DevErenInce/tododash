import 'package:flutter/foundation.dart';
import 'package:generation/generation.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration config}) {
    env = config;
  }

  AppEnvironment.general() {
    env = !kDebugMode ? DevEnv() : ProdEnv();
  }

  static late final AppConfiguration env;
}
