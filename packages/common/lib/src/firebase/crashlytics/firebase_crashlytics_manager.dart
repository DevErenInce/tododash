import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseCrashlyticsManager {
  FirebaseCrashlyticsManager._init();
  static FirebaseCrashlyticsManager? _instance;
  static final FirebaseCrashlyticsManager instance =
      _instance ??= FirebaseCrashlyticsManager._init();

  Future<void> init() async {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  void testCrash() {
    FirebaseCrashlytics.instance.crash();
  }
}
