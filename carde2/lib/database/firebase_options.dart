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
        return macos;
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
    apiKey: 'AIzaSyBO4Jv--4WilZ6XrJBtVDy8GVdMFgAt2O0',
    appId: '1:362327435420:web:dc02e809eb23324130a559',
    messagingSenderId: '362327435420',
    projectId: 'wecard-78c44',
    authDomain: 'wecard-78c44.firebaseapp.com',
    storageBucket: 'wecard-78c44.appspot.com',
    measurementId: 'G-TCJFMV1K3C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuAGbP-yuEMHiqXiNhbfi3x2AhLNK-11U',
    appId: '1:362327435420:android:6aa2d2296afed3dd30a559',
    messagingSenderId: '362327435420',
    projectId: 'wecard-78c44',
    storageBucket: 'wecard-78c44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMi6C7EZpigIIh6BHY-fRCrVQGBTNgAEU',
    appId: '1:362327435420:ios:05b464d609e39a7830a559',
    messagingSenderId: '362327435420',
    projectId: 'wecard-78c44',
    storageBucket: 'wecard-78c44.appspot.com',
    iosClientId:
        '362327435420-9icccu0svser68npfha6nlbldp1d68lk.apps.googleusercontent.com',
    iosBundleId: 'com.example.carde2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMi6C7EZpigIIh6BHY-fRCrVQGBTNgAEU',
    appId: '1:362327435420:ios:05b464d609e39a7830a559',
    messagingSenderId: '362327435420',
    projectId: 'wecard-78c44',
    storageBucket: 'wecard-78c44.appspot.com',
    iosClientId:
        '362327435420-9icccu0svser68npfha6nlbldp1d68lk.apps.googleusercontent.com',
    iosBundleId: 'com.example.carde2',
  );
}