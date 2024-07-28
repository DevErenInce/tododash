import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;

class DefaultFirebaseOptions {
  FirebaseOptions getFirebaseOptions(String flavor) {
    if (flavor == 'DEV') {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return androidDev;
        case TargetPlatform.iOS:
          return iosDev;
        case TargetPlatform.macOS:
          return macosDev;
        case TargetPlatform.windows:
          throw UnsupportedError(
            'DefaultFirebaseOptions have not been configured for windows - '
            'you can reconfigure this by running the FlutterFire CLI again.',
          );
        case TargetPlatform.linux:
          throw UnsupportedError(
            'DefaultFirebaseOptions have not been configured for linux - '
            'you can reconfigure this by running the FlutterFire CLI again.',
          );
        default:
          throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.',
          );
      }
    }

    if (flavor == 'PROD') {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return androidProd;
        case TargetPlatform.iOS:
          return iosProd;
        case TargetPlatform.macOS:
          return macosProd;
        case TargetPlatform.windows:
          throw UnsupportedError(
            'DefaultFirebaseOptions have not been configured for windows - '
            'you can reconfigure this by running the FlutterFire CLI again.',
          );
        case TargetPlatform.linux:
          throw UnsupportedError(
            'DefaultFirebaseOptions have not been configured for linux - '
            'you can reconfigure this by running the FlutterFire CLI again.',
          );
        default:
          throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.',
          );
      }
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this flavor.',
    );
  }

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyC94H4Z9jMZu0xnqTuEs97Q9xtOeVdPiuw',
  //   appId: '1:451019353349:web:da79dbb7d336117a355b6c',
  //   messagingSenderId: '451019353349',
  //   projectId: 'tododash-app-project',
  //   authDomain: 'tododash-app-project.firebaseapp.com',
  //   storageBucket: 'tododash-app-project.appspot.com',
  //   measurementId: 'G-9318D4JPV3',
  // );

  static const FirebaseOptions androidDev = FirebaseOptions(
    apiKey: 'AIzaSyD3zUjxbIz368EAgELGOYeNZnzk6qTlelg',
    appId: '1:516408653455:android:ec1190de11a4ab37afe2fa',
    messagingSenderId: '516408653455',
    projectId: 'tododash-dev',
    storageBucket: 'tododash-dev.appspot.com',
  );

  static const FirebaseOptions androidProd = FirebaseOptions(
    apiKey: 'AIzaSyCuLAaESx1SPZv4p241NylYSy-pU77SC_E',
    appId: '1:1084163176337:android:8c370f079872fc2c57cc30',
    messagingSenderId: '1084163176337',
    projectId: 'tododash-prod',
    storageBucket: 'tododash-prod.appspot.com',
  );

  static const FirebaseOptions iosDev = FirebaseOptions(
    apiKey: 'AIzaSyDBgcFhN_D5eOgDJKgWJfZWNn6d6YMuZmo',
    appId: '1:516408653455:ios:97241997dae38113afe2fa',
    messagingSenderId: '516408653455',
    projectId: 'tododash-dev',
    storageBucket: 'tododash-dev.appspot.com',
    iosBundleId: 'com.wecann.app.tododash.dev',
  );

  static const FirebaseOptions iosProd = FirebaseOptions(
    apiKey: 'AIzaSyCi_H71KsnD_inJiwaGSBbdGmMTsMhKFNM',
    appId: '1:1084163176337:ios:4bc92ef40978060857cc30',
    messagingSenderId: '1084163176337',
    projectId: 'tododash-prod',
    storageBucket: 'tododash-prod.appspot.com',
    iosBundleId: 'com.wecann.app.tododash',
  );

  static const FirebaseOptions macosDev = FirebaseOptions(
    apiKey: 'AIzaSyDBgcFhN_D5eOgDJKgWJfZWNn6d6YMuZmo',
    appId: '1:516408653455:ios:f7e88200af3bc943afe2fa',
    messagingSenderId: '516408653455',
    projectId: 'tododash-dev',
    storageBucket: 'tododash-dev.appspot.com',
    iosBundleId: 'com.wecann.app.tododash.mac.dev',
  );

  static const FirebaseOptions macosProd = FirebaseOptions(
    apiKey: 'AIzaSyCi_H71KsnD_inJiwaGSBbdGmMTsMhKFNM',
    appId: '1:1084163176337:ios:b772896a2b2a1b9257cc30',
    messagingSenderId: '1084163176337',
    projectId: 'tododash-prod',
    storageBucket: 'tododash-prod.appspot.com',
    iosBundleId: 'com.wecann.app.tododash.mac',
  );
}
