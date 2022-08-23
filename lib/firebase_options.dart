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
    apiKey: 'AIzaSyAWME9QLwPoMvs4XiPlm8rn-d_6aszLQNA',
    appId: '1:212576114202:web:26afd6a015853bf30aa3a3',
    messagingSenderId: '212576114202',
    projectId: 'minecloud-90b2c',
    authDomain: 'minecloud-90b2c.firebaseapp.com',
    storageBucket: 'minecloud-90b2c.appspot.com',
    measurementId: 'G-41RZZ64QFF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIfDMR8CfiXmmqpFdInK4uvky_-e8t4SA',
    appId: '1:212576114202:android:3bbfca949a03d8490aa3a3',
    messagingSenderId: '212576114202',
    projectId: 'minecloud-90b2c',
    storageBucket: 'minecloud-90b2c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaSKUk9Ub2LU2MKdf2cYHUVUGxmaOMChg',
    appId: '1:212576114202:ios:87abf780ec69f68e0aa3a3',
    messagingSenderId: '212576114202',
    projectId: 'minecloud-90b2c',
    storageBucket: 'minecloud-90b2c.appspot.com',
    androidClientId: '212576114202-g9vjoks6aoa9ngpmj1ursmr825pvb3o1.apps.googleusercontent.com',
    iosClientId: '212576114202-v8ptcml1p7poi4mkmos8s473j8gnl864.apps.googleusercontent.com',
    iosBundleId: 'com.biton.minecloud.minecloudTal',
  );
}
