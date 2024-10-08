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
    apiKey: 'AIzaSyDADx8nL3omAHdJ0Bt1gKW2sS5hMryEj5A',
    appId: '1:906792168270:web:b26d21ea5c980034588c1f',
    messagingSenderId: '906792168270',
    projectId: 'rego-10ab1',
    authDomain: 'rego-10ab1.firebaseapp.com',
    storageBucket: 'rego-10ab1.appspot.com',
    measurementId: 'G-CVD9EHRNRJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCpbc6Pkx6a9dWtWlSJ-HOHbGQzYZIl54',
    appId: '1:906792168270:android:bbfeb2bd9c78d056588c1f',
    messagingSenderId: '906792168270',
    projectId: 'rego-10ab1',
    storageBucket: 'rego-10ab1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0z3FNnb1AuBB99b6PXk3zt4lGcZnnMhk',
    appId: '1:906792168270:ios:00629a147a18aacc588c1f',
    messagingSenderId: '906792168270',
    projectId: 'rego-10ab1',
    storageBucket: 'rego-10ab1.appspot.com',
    iosBundleId: 'com.example.rigow',
  );
}
