import 'dart:async';

import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generation/generation.dart';
import 'package:tododash/product/state/container/product_state_container.dart';

final class ApplicationInitialize {
  late AppConfiguration _environment;

  Future<void> make({required AppConfiguration environment}) async {
    WidgetsFlutterBinding.ensureInitialized();
    _environment = environment;
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        // Handle Error
      },
    );
  }

  Future<void> _initialize() async {
    print('START ENVIRONMENT: ${_environment.environment}');

    //Easy Localization Initialize
    await ProductLocalization.init();

    //Set Orientation Portrait
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    //App Environment Initialize
    _productEnvironmentWithContainer();

    //Firebase Initialize
    await FirebaseManager.instance.init(_environment.environment);
  }

  /// DO NOT CHANGE THIS METHOD
  void _productEnvironmentWithContainer() {
    AppEnvironment.setup(config: _environment);

    ProductContainer.setup();
  }
}
