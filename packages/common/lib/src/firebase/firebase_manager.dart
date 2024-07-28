import 'package:common/common.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseManager {
  FirebaseManager._init();
  static FirebaseManager? _instance;
  static final FirebaseManager instance = _instance ??= FirebaseManager._init();

  Future<void> init(String flavor) async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions().getFirebaseOptions(flavor),
      );
      await FirebaseCrashlyticsManager.instance.init();
    } catch (e) {
      print('Firebase initialization error: $e');
    }
  }
}
