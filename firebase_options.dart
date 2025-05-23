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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCN5MPsvkYAlGJ9AUwC7m9-c4flMEki11Q',
    appId: '1:330114675486:web:5c7e91c83f463fa5b34f0f',
    messagingSenderId: '330114675486',
    projectId: 'mubashar-27b17',
    authDomain: 'mubashar-27b17.firebaseapp.com',
    storageBucket: 'mubashar-27b17.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBp3oV82cdbyPpyT1ZCxl41gVOmVpc_yk0',
    appId: '1:330114675486:android:7ee74a35e71ecb1fb34f0f',
    messagingSenderId: '330114675486',
    projectId: 'mubashar-27b17',
    storageBucket: 'mubashar-27b17.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCN5MPsvkYAlGJ9AUwC7m9-c4flMEki11Q',
    appId: '1:330114675486:web:37a139d4f979aa8ab34f0f',
    messagingSenderId: '330114675486',
    projectId: 'mubashar-27b17',
    authDomain: 'mubashar-27b17.firebaseapp.com',
    storageBucket: 'mubashar-27b17.firebasestorage.app',
  );
}
