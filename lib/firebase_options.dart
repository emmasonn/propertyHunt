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
    apiKey: 'AIzaSyDFav4wY_ZLWj5QJpb_QMMINoPjtstwspM',
    appId: '1:41324374842:web:8cc27423b3adcae74bfe03',
    messagingSenderId: '41324374842',
    projectId: 'expertpropertyhunt',
    authDomain: 'expertpropertyhunt.firebaseapp.com',
    storageBucket: 'expertpropertyhunt.appspot.com',
    measurementId: 'G-G9H9V92CLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrxRPHDn0rTT8ZKujE54sojRtG3DMXUOQ',
    appId: '1:41324374842:android:4aa936a7b1b443554bfe03',
    messagingSenderId: '41324374842',
    projectId: 'expertpropertyhunt',
    storageBucket: 'expertpropertyhunt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEUTfMT39AdIBkRgJuHFUON0OGAKIXTzo',
    appId: '1:41324374842:ios:81207c0bbbfdb6d44bfe03',
    messagingSenderId: '41324374842',
    projectId: 'expertpropertyhunt',
    storageBucket: 'expertpropertyhunt.appspot.com',
    iosClientId: '41324374842-u31p4fc4chjvcgvm144isnqouftccqof.apps.googleusercontent.com',
    iosBundleId: 'com.beacon.properties',
  );
}
