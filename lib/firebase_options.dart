// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBMpiZpkw-MKdSFQYT9ThvArhrcLjLZ63w',
    appId: '1:713485588494:web:bad16e764d7a2081d9045f',
    messagingSenderId: '713485588494',
    projectId: 'apps-cbf28',
    authDomain: 'apps-cbf28.firebaseapp.com',
    storageBucket: 'apps-cbf28.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBR9RgbXcjOeWp-Cxy8nglxGBTMeYKQwSM',
    appId: '1:713485588494:android:254c05a8fc535c2dd9045f',
    messagingSenderId: '713485588494',
    projectId: 'apps-cbf28',
    storageBucket: 'apps-cbf28.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWn2fgWKQnncz_7atdL4J5GxlefazrOgM',
    appId: '1:713485588494:ios:ffcb2ca30e5b263cd9045f',
    messagingSenderId: '713485588494',
    projectId: 'apps-cbf28',
    storageBucket: 'apps-cbf28.appspot.com',
    iosBundleId: 'com.example.firebase',
  );
}