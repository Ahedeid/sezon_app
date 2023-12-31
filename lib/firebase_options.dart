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
    apiKey: 'AIzaSyCuKaANAoQ4mvyPziA8BUgH9diUUArJH5E',
    appId: '1:1015843718442:web:f7fb3ab9d99d580d354a53',
    messagingSenderId: '1015843718442',
    projectId: 'sezon-app-41811',
    authDomain: 'sezon-app-41811.firebaseapp.com',
    storageBucket: 'sezon-app-41811.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQAwPPxmJaKAtoISoDl8x2H7GyIzQBPck',
    appId: '1:1015843718442:android:720cda34dc3011cd354a53',
    messagingSenderId: '1015843718442',
    projectId: 'sezon-app-41811',
    storageBucket: 'sezon-app-41811.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvI-7bRwOTF5oxsW7UuYuCJCMdCATXqyA',
    appId: '1:1015843718442:ios:81dc17daf9426de9354a53',
    messagingSenderId: '1015843718442',
    projectId: 'sezon-app-41811',
    storageBucket: 'sezon-app-41811.appspot.com',
    iosBundleId: 'com.example.sezonApp',
  );
}
