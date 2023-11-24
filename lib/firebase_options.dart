// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCk5FlzBNDj702N9HWwxoxdmSxNLCr_CVc',
    appId: '1:250025969564:web:06a0a7d6258e5fbecf6a59',
    messagingSenderId: '250025969564',
    projectId: 'swiftrider',
    authDomain: 'swiftrider.firebaseapp.com',
    storageBucket: 'swiftrider.appspot.com',
    measurementId: 'G-XGVNNCWCD2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7qbgRI19biCQiMxL5nzl-Rq9ClRDF9Gk',
    appId: '1:250025969564:android:d4bc698bd3571202cf6a59',
    messagingSenderId: '250025969564',
    projectId: 'swiftrider',
    storageBucket: 'swiftrider.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCm7SpHYyp1-1wrK-UKTa1awh9IiwSCqBw',
    appId: '1:250025969564:ios:08be24ae8e7e1492cf6a59',
    messagingSenderId: '250025969564',
    projectId: 'swiftrider',
    storageBucket: 'swiftrider.appspot.com',
    iosClientId: '250025969564-i7g1r2lpf7ulrba345m3iskegcbtn308.apps.googleusercontent.com',
    iosBundleId: 'com.example.helloWorld',
  );
}
